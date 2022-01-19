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
            SocialLoginButton(icon: "ic_naver", title: "네이버 로그인", foregroundColor: .white, backgroundColor: Color(hex: "#03C75A")) {
                UserLoginManager.shared.doSocialLoginBy(loginType: .naver)
            }
            SocialLoginButton(icon: "ic_kakao", title: "카카오로 로그인", foregroundColor: .black, backgroundColor: Color(hex: "#FEE500")) {
                UserLoginManager.shared.doSocialLoginBy(loginType: .kakao)
            }
            SocialLoginButton(icon: "ic_facebook", title: "Facebook으로 로그인", foregroundColor: .white, backgroundColor: Color(hex: "#1877F2")) {
                UserLoginManager.shared.doSocialLoginBy(loginType: .facebook)
            }
            SocialLoginButton(icon: "ic_google", title: "Google로 로그인", foregroundColor: .black, backgroundColor: .white) {
                UserLoginManager.shared.doSocialLoginBy(loginType: .google)
            }
            .overlay(RoundedRectangle(cornerRadius: 12)
                        .strokeBorder())
            
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
