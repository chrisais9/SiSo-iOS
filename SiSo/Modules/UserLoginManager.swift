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
import NaverThirdPartyLogin
import Alamofire

final class UserLoginManager: NSObject {
    
    private let googleClientID: String = "615397119216-nvgj2f2p9a1n1c326lo2hlftcguol2m2.apps.googleusercontent.com"
    
    private lazy var configuration: GIDConfiguration = {
        return GIDConfiguration(clientID: googleClientID)
    }()
    
    static let shared = UserLoginManager()
    private override init() { }
    
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
            doLoginNaver()
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
                doLogoutNaver()
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
        loginManager.logIn(permissions: ["public_profile", "email"], from: rootViewController) { result, error in
            if let error = error {
                print("Encountered Erorr: \(error)")
            } else if let result = result, result.isCancelled {
                print("Cancelled")
            } else {
                print("success")
                self.getUserProfileFacebook()
            }
        }
    }
    
    private func getUserProfileFacebook() {
        Profile.loadCurrentProfile { profile, error in
            guard error == nil else {
                print("Encountered Erorr: \(error.debugDescription)")
                return
            }
            self.setUser(
                loginType: .facebook,
                profileImage: profile?.imageURL(forMode: .large, size: .init(width: 320, height: 320))?.absoluteString,
                name: profile?.name,
                email: profile?.email
            )
        }
    }
    
    private func doLogoutFacebook() {
        let loginManager = LoginManager()
        loginManager.logOut()
        deleteUser()
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

// Naver Login
extension UserLoginManager: NaverThirdPartyLoginConnectionDelegate {
    
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("called")
        getUserProfileNaver()
    }
    
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        
    }
    
    func oauth20ConnectionDidFinishDeleteToken() {
        
    }
    
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print(error)
    }
    
    private func doLoginNaver() {
        let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
        loginInstance?.delegate = self
        loginInstance?.requestThirdPartyLogin()
        
    }
    
    private func getUserProfileNaver() {
        let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
        guard let isValidAccessToken = loginInstance?.isValidAccessTokenExpireTimeNow() else { return }
        
        if !isValidAccessToken {
            return
        }
        
        guard let tokenType = loginInstance?.tokenType else { return }
        guard let accessToken = loginInstance?.accessToken else { return }
        let urlStr = "https://openapi.naver.com/v1/nid/me"
        let url = URL(string: urlStr)!
        
        let authorization = "\(tokenType) \(accessToken)"
        
        let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
        
        req.responseDecodable(of: NaverProfileResponse.self) { response in
            if response.response?.statusCode == 200, let naverProfileResponse = response.value {
                self.setUser(
                    loginType: .naver,
                    profileImage: naverProfileResponse.response.profileImage,
                    name: naverProfileResponse.response.nickname,
                    email: naverProfileResponse.response.email
                )
            }
        }
    }
    
    private func doLogoutNaver() {
        let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
        loginInstance?.removeNaverLoginCookie()
        loginInstance?.requestDeleteToken()
        deleteUser()
    }
}
