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
import RealmSwift
import NaverThirdPartyLogin

@main
struct SiSoApp: SwiftUI.App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        FirebaseApp.configure()
        NMFAuthManager.shared().clientId = "gyrtzz3dq2"
        KakaoSDK.initSDK(appKey: "4d2a5fa60de38bafa5a03910ed458fef")
        
        let instance = NaverThirdPartyLoginConnection.getSharedInstance()
        
        instance?.isNaverAppOauthEnable = true
        instance?.isInAppOauthEnable = true
        instance?.setOnlyPortraitSupportInIphone(true)
        
        instance?.serviceUrlScheme = kServiceAppUrlScheme // 앱을 등록할 때 입력한 URL Scheme
        instance?.consumerKey = kConsumerKey // 상수 - client id
        instance?.consumerSecret = kConsumerSecret // pw
        instance?.appName = kServiceAppName // app name
        
    }
    
    
    var realmConfigration: Realm.Configuration {
        var config = Realm.Configuration.defaultConfiguration
        config.deleteRealmIfMigrationNeeded = true
        return config
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.realmConfiguration, realmConfigration)
                .onOpenURL { url in
                    
                    // https://devtalk.kakao.com/t/topic/119363/10 네이버 로그인과 같이 사용시 메인스레드 패닉오는 버그때는에 if-else 처리함
                    
                    // Kakao
                    if AuthApi.isKakaoTalkLoginUrl(url) {
                        let _ = AuthController.handleOpenUrl(url: url)
                    }
                    // Facebook
                    else if(ApplicationDelegate.shared.application(
                        UIApplication.shared,
                        open: url,
                        sourceApplication: nil,
                        annotation: UIApplication.OpenURLOptionsKey.annotation
                    )) {
                    }
                    // Google
                    else if(GIDSignIn.sharedInstance.handle(url)) {
                    }
                    else {
                        // Naver
                        NaverThirdPartyLoginConnection
                            .getSharedInstance()?
                            .receiveAccessToken(url)
                    }
                }
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication,
                         didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
            return true
        }
    }
}

extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}
