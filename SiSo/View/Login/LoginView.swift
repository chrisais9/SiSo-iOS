//
//  LoginView.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/21.
//

import SwiftUI
import KakaoSDKUser
import FBSDKLoginKit
import RealmSwift

struct LoginView: View {
    
    var body: some View {
        VStack {
            Button {
                if UserApi.isKakaoTalkLoginAvailable() {
                    UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                        if let error = error {
                            print(error)
                        } else {
                            print("kakao login success \(oauthToken?.accessToken ?? "")")
                        }
                    }
                } else {
                    UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                        if let error = error {
                            print(error)
                        }
                        else {
                            print("kakao login success \(oauthToken?.accessToken ?? "")")
                        }
                    }
                }
            } label: {
                Image("btn_kakao_login")
                    .resizable()
                    .frame(height: 60)
            }
            
            Button {
                UserLoginManager.shared.doLoginFacebook()
            } label: {
                Text("페북 로그인")
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 4)
                    .strokeBorder())
            }

            
            GoogleLoginButton(handler: UserLoginManager.shared.doLoginGoogle)
            .frame(height: 60)
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
