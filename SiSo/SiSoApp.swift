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
import FBSDKCoreKit
import Firebase
import GoogleSignIn

@main
struct SiSoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        FirebaseApp.configure()
        NMFAuthManager.shared().clientId = "gyrtzz3dq2"
        KakaoSDK.initSDK(appKey: "4d2a5fa60de38bafa5a03910ed458fef")
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    // google
                    GIDSignIn.sharedInstance.handle(url)
                    if AuthApi.isKakaoTalkLoginUrl(url) { // kakao
                        let _ = AuthController.handleOpenUrl(url: url)
                    }
                    ApplicationDelegate.shared.application( // facebook
                        UIApplication.shared,
                        open: url,
                        sourceApplication: nil,
                        annotation: UIApplication.OpenURLOptionsKey.annotation
                    )
                }
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication,
                         didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        }
        
        func application(_ app: UIApplication,
                         open url: URL,
                         options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
            if (AuthApi.isKakaoTalkLoginUrl(url)) {
                        return AuthController.handleOpenUrl(url: url)
            }
            return ApplicationDelegate.shared.application(app, open: url, options: options)
        }
    }
}

extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
