//
//  LoginView.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/21.
//

import SwiftUI

struct LoginView: View {
    
    var body: some View {
        VStack {
            Button {
                UserLoginManager.shared.doSocialLoginBy(loginType: .kakao)
            } label: {
                Image("btn_kakao_login")
                    .resizable()
                    .frame(height: 60)
            }
            
            Button {
                UserLoginManager.shared.doSocialLoginBy(loginType: .naver)
            } label: {
                Image("btn_naver_login")
                    .resizable()
                    .frame(height: 60)
            }
            
            Button {
                UserLoginManager.shared.doSocialLoginBy(loginType: .facebook)
            } label: {
                Text("페북 로그인")
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 4)
                    .strokeBorder())
            }

            
            GoogleLoginButton(handler: {
                UserLoginManager.shared.doSocialLoginBy(loginType: .google)
            })
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
