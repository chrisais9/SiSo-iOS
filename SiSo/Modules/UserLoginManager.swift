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
    
    func setUser(
        jwtToken: String? = nil,
        loginType: LoginType? = nil,
        profileImage: String? = nil,
        name: String? = nil,
        email: String? = nil,
        createdAt: Date? = nil,
        updatedAt: Date? = nil
    ) {
        let realm = try! Realm()
        
        // 기존에 유저 정보가 realm 에 존재 하면
        if let user = realm.objects(User.self).first {
            try! realm.write {
                if let jwtToken = jwtToken {
                    user.jwtToken = jwtToken
                }
                if let loginType = loginType {
                    user.loginType = loginType
                }
                if let profileImage = profileImage {
                    user.profileImage = profileImage
                }
                if let name = name {
                    user.name = name
                }
                if let email = email {
                    user.email = email
                }
                if let createdAt = createdAt {
                    user.createdAt = createdAt
                }
                if let updatedAt = updatedAt {
                    user.updatedAt = updatedAt
                }
            }
        }
        // 없으면 새로 만들어서 입력함
        else {
            let user = User()
            if let jwtToken = jwtToken {
                user.jwtToken = jwtToken
            }
            if let loginType = loginType {
                user.loginType = loginType
            }
            if let profileImage = profileImage {
                user.profileImage = profileImage
            }
            if let name = name {
                user.name = name
            }
            if let email = email {
                user.email = email
            }
            if let createdAt = createdAt {
                user.createdAt = createdAt
            }
            if let updatedAt = updatedAt {
                user.updatedAt = updatedAt
            }
            try! realm.write {
                realm.add(user)
            }
        }
    }
    
    func doSocialLoginBy(loginType: LoginType) {
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
    
    func doServerLogin(type: LoginType, token: String) {
        Repositories.shared.loginWithSocialToken(type: type, token: token) { status, loginResponse in
            switch status {
            case .ok: // 로그인 성공
                if let jwtToken = loginResponse?.data {
                    self.setUser(jwtToken: jwtToken, loginType: type)
                    self.getUserProfile()
                }
            default:
                break
            }
        }
    }
    
    func doServerRegister(type: LoginType, token: String) {
        Repositories.shared.registerWithSocialToken(type: type, token: token) { status, registerResponse in
            switch status {
            case .ok:
                if let jwtToken = registerResponse?.data {
                    self.setUser(jwtToken: jwtToken, loginType: type)
                    self.getUserProfile()
                }
            case .conflict: // 회원가입 하려는데 이미 유저정보가 존재함 -> 로그인 진행
                self.doServerLogin(type: type, token: token)
            default:
                break
            }
        }
    }
    
    func getUserProfile() {
        Repositories.shared.fetchProfileInfo { status, profileResponse in
            switch status {
            case .ok:
                if let userInfo = profileResponse?.data {
                    print(userInfo)
                    self.setUser(
                        profileImage: userInfo.profileImage,
                        name: userInfo.userName,
                        email: userInfo.email
                    )
                }
            default:
                break
            }
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
        print("user deleted from local")
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
                else if let accessToken = oauthToken?.accessToken {
                    self.doServerRegister(type: .kakao, token: accessToken)
                    print("kakao login success \(oauthToken?.accessToken ?? "")")
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else if let accessToken = oauthToken?.accessToken {
                    self.doServerRegister(type: .kakao, token: accessToken)
                    print("kakao login success \(oauthToken?.accessToken ?? "")")
                }
            }
        }
    }
    
    private func doLogoutKakao() {
        self.deleteUser()
        UserApi.shared.logout { error in
            if let error = error {
                print(error)
            }
        }
    }
}

// Facebook Login
extension UserLoginManager {
    private func doLoginFacebook() {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: [], viewController: nil) { result in
            switch result {
            case .failed(let error):
                print(error)
            case .cancelled:
            case .success(_, _, let accessToken):
                if let token = accessToken?.tokenString {
                    self.doServerRegister(type: .facebook, token: token)
                }
            }
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
            
            //            self.setUser(
            //                loginType: .google,
            //                profileImage: socialUser.profile?.imageURL(withDimension: 320)?.absoluteString,
            //                name: socialUser.profile?.name!,
            //                email: socialUser.profile?.email!
            //            )
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
