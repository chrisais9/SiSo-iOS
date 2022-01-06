//
//  LoginView.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/21.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var isLoginDialogShowing: Bool = false
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("그래, 그거")
                    .font(.title)
                    .bold()
                
                Text("어려운 장소 선택 '그래, 그거'로 한번에 해결")
                    .font(.callout)
                    .bold()
            }.padding([.top, .bottom], 70)
            
            VStack(alignment: .leading) {
                Text("이메일 주소")
                TextField("이메일 주소를 입력해주세요.", text: $email)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .padding(.bottom, 20)
            
                Text("비밀번호")
                
                SecureField("비밀번호를 입력해주세요.", text: $password)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black, lineWidth: 1)
                    )
                
            }
            .padding(.horizontal, 25)
        
            
            LargeButton(title: "로그인", disabled: email.isEmpty || password.isEmpty, foregroundColor: .black) {
                isLoginDialogShowing.toggle()
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 20)
            
            HStack {
                Button {
                    
                } label: {
                    Text("비밀번호를 잊으셨나요?")
                        .foregroundColor(.black)
                }
                Text("|")
                Button {
                    
                } label: {
                    Text("회원가입")
                        .bold()
                        .foregroundColor(.black)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .simpleDialog(isShowing: $isLoginDialogShowing) {
            VStack {
                Text("로그인 오류")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.vertical, 17)
                Text("가입되지 않은 이메일 주소입니다.\n확인 후 다시 입력해주세요.")
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 13)
                
                Divider()
                Button(action: {
                    isLoginDialogShowing.toggle()
                }) {
                    Text("확인")
                        .foregroundColor(.black)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.bottom)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
