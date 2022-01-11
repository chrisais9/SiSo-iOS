//
//  SiSoApp.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/21.
//

import SwiftUI
import NMapsMap
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct SiSoApp: App {
    
    init() {
//        SisoSocketManager.shared.openConnection()
        NMFAuthManager.shared().clientId = "gyrtzz3dq2"
        KakaoSDK.initSDK(appKey: "4d2a5fa60de38bafa5a03910ed458fef")
        
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    if AuthApi.isKakaoTalkLoginUrl(url) {
                        AuthController.handleOpenUrl(url: url)
                    }
                }
        }
    }
}

extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
