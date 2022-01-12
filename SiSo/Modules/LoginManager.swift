//
//  LoginManager.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/12.
//

import SwiftUI
import GoogleSignIn
import RealmSwift

final class LoginManager {
    
    private let googleClientID: String = "615397119216-nvgj2f2p9a1n1c326lo2hlftcguol2m2.apps.googleusercontent.com"
    
    private lazy var configuration: GIDConfiguration = {
        return GIDConfiguration(clientID: googleClientID)
    }()
    
    static let shared = LoginManager()
    private init() { }
}

// Google Login
extension LoginManager {
    func doLoginGoogle() {
        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {
            print("There is no root view controller!")
            return
        }
        GIDSignIn.sharedInstance.signIn(with: configuration,
                                        presenting: rootViewController) { socialUser, error in
            guard let socialUser = socialUser else {
                print("Error! \(String(describing: error))")
                return
            }
            
            let user = User()
            user.name = socialUser.profile?.name ?? "익명"
            user.profileImage = socialUser.profile?.imageURL(withDimension: 320)?.absoluteString ?? ""
            user.email = socialUser.profile?.email ?? ""
            
            let realm = try! Realm()
            try! realm.write {
                realm.delete(realm.objects(User.self))
                realm.add(user)
            }
        }
    }
    
    func doLogoutGoogle() {
        GIDSignIn.sharedInstance.signOut()
        
        let realm = try! Realm()
        try! realm.write {
            realm.delete(realm.objects(User.self))
        }
    }
}
