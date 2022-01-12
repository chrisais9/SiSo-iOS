//
//  GoogleLoginButton+SwiftUI.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/12.
//

import SwiftUI
import GoogleSignIn

struct GoogleLoginButton: UIViewRepresentable {
    
    let handler: () -> Void
    
    init(handler: @escaping () -> Void) {
        self.handler = handler
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    func makeUIView(context: Context) -> GIDSignInButton {
        let signInButton = GIDSignInButton()
        signInButton.style = GIDSignInButtonStyle.wide
        signInButton.addTarget(context.coordinator,
                               action: #selector(Coordinator.callHandler),
                               for: .touchUpInside)
        return signInButton
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        context.coordinator.handler = handler
    }
}

extension GoogleLoginButton {
    class Coordinator {
        var handler: (() -> Void)?
        
        @objc func callHandler() {
            handler?()
        }
    }
}
