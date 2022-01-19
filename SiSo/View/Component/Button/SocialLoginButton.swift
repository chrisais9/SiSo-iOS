//
//  SocialLoginButton.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/19.
//

import SwiftUI

struct SocialLoginButton: View {
    
    let icon: String
    let title: String
    
    let foregroundColor: Color
    let backgroundColor: Color
    
    let action: () -> Void
    
    init(icon: String,
         title: String,
         foregroundColor: Color = Color.white,
         backgroundColor: Color = Color.blue,
         action: @escaping () -> Void) {
        self.icon = icon
        self.title = title
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.action = action
    }
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Image(icon)
                    .resizable()
                    .frame(width: 21, height: 21)
                    .scaledToFit()
                Text(title)
                    .font(NotoSans.medium(size: 14))
                    .foregroundColor(foregroundColor)
                
            }
            .cornerRadius(12)
            .frame(maxWidth:.infinity, maxHeight: 50)
            .padding(.horizontal, 12)
            .background(
                backgroundColor
                    .cornerRadius(12)
            )
        }
    }
}

struct SocialLoginButton_Previews: PreviewProvider {
    static var previews: some View {
        SocialLoginButton(icon: "ic_google", title: "Facebook으로 로그인", foregroundColor: .white, backgroundColor: Color(hex: "#1877F2")) {
            
        }
    }
}
