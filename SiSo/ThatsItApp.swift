//
//  ThatsItApp.swift
//  ThatsIt
//
//  Created by 구형모 on 2021/12/21.
//

import SwiftUI
import NMapsMap

@main
struct ThatsItApp: App {
    
    init() {
        NMFAuthManager.shared().clientId = "gyrtzz3dq2"
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
