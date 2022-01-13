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
                UserLoginManager.shared.doLoginKakao()
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
