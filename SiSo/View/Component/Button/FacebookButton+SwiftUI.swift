//
//  FacebookButton+SwiftUI.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/11.
//

import SwiftUI
import FBSDKLoginKit

struct FacebookLoginButton: UIViewRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return FacebookLoginButton.Coordinator(parent: self)
    }
    func makeUIView(context: Context) -> some UIView {
        let button = FBLoginButton()
        button.delegate = context.coordinator
        return button
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    class Coordinator: NSObject, LoginButtonDelegate {
        
        var parent: FacebookLoginButton
        
        init(parent: FacebookLoginButton) {
            self.parent = parent
        }
        func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
            
        }
        
        func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
            
        }
        
    }
}
