//
//  UserLoginManager.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/12.
//

import SwiftUI
import GoogleSignIn
import RealmSwift
import FBSDKLoginKit
import KakaoSDKUser

final class UserLoginManager {
    
    private let googleClientID: String = "615397119216-nvgj2f2p9a1n1c326lo2hlftcguol2m2.apps.googleusercontent.com"
    
    private lazy var configuration: GIDConfiguration = {
        return GIDConfiguration(clientID: googleClientID)
    }()
    
    static let shared = UserLoginManager()
    private init() { }
    
    func setUser(loginType: LoginType, profileImage: String?, name: String?, email: String?) {
        let user = User()
        user.loginType = loginType
        user.profileImage = profileImage ?? ""
        user.name = name ?? "익명"
        user.email = email ?? ""
        
        let realm = try! Realm()
        try! realm.write {
            realm.delete(realm.objects(User.self))
            realm.add(user)
        }
    }
    
    func doLogin(loginType: LoginType) {
        switch loginType {
        case .none:
            break
        case .google:
            doLoginGoogle()
        case .kakao:
            doLoginKakao()
        case .facebook:
            doLoginFacebook()
        case .naver:
            break // not implemented
        case .apple:
            break // not implemented
        }
    }
    
    func doLogout() {
        let realm = try! Realm()
        realm.objects(User.self).forEach { user in
            switch user.loginType {
            case .none:
                break
            case .google:
                doLogoutGoogle()
            case .kakao:
                doLogoutKakao()
            case .facebook:
                doLogoutFacebook()
            case .naver:
                break // not implemented
            case .apple:
                break // not implemented
            }
            
        }
    }
    
    func deleteUser() {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(realm.objects(User.self))
        }
    }
}

// Kakao Login
extension UserLoginManager {
    private func doLoginKakao() {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    self.getUserProfileKakao()
                    print("kakao login success \(oauthToken?.accessToken ?? "")")
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    self.getUserProfileKakao()
                    print("kakao login success \(oauthToken?.accessToken ?? "")")
                }
            }
        }
    }
    
    private func getUserProfileKakao() {
        UserApi.shared.me { user, error in
            if let error = error {
                print(error)
            }
            else {
                self.setUser(
                    loginType: .kakao,
                    profileImage: user?.kakaoAccount?.profile?.profileImageUrl?.absoluteString,
                    name: user?.kakaoAccount?.profile?.nickname,
                    email: user?.kakaoAccount?.email
                )
            }
        }
    }
    
    private func doLogoutKakao() {
        UserApi.shared.logout { error in
            if let error = error {
                print(error)
            }
        }
        self.deleteUser()
    }
}

// Facebook Login
extension UserLoginManager {
    private func doLoginFacebook() {
        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {
            print("There is no root view controller!")
            return
        }
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile", "email", "name"], from: rootViewController) { result, error in
            if let error = error {
                print("Encountered Erorr: \(error)")
            } else if let result = result, result.isCancelled {
                print("Cancelled")
            } else {
                self.getUserProfileFacebook()
            }
        }
    }
    
    private func getUserProfileFacebook() {
        Profile.loadCurrentProfile { profile, error in
            self.setUser(
                loginType: .facebook,
                profileImage: profile?.imageURL?.absoluteString,
                name: profile?.name,
                email: profile?.email
            )
        }
    }
    
    private func doLogoutFacebook() {
        let loginManager = LoginManager()
        loginManager.logOut()
    }
}

// Google Login
extension UserLoginManager {
    private func doLoginGoogle() {
        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {
            print("There is no root view controller!")
            return
        }
        GIDSignIn.sharedInstance.signIn(with: configuration,
                                        presenting: rootViewController) { socialUser, error in
            guard let socialUser = socialUser else {
                print("Error! \(String(describing: error))")
                return
            }
            
            self.setUser(
                loginType: .google,
                profileImage: socialUser.profile?.imageURL(withDimension: 320)?.absoluteString,
                name: socialUser.profile?.name,
                email: socialUser.profile?.email
            )
        }
    }
    
    private func doLogoutGoogle() {
        GIDSignIn.sharedInstance.signOut()
        deleteUser()
    }
}
