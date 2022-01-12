//
//  UserLoginManager.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/12.
//

import SwiftUI
import GoogleSignIn
import RealmSwift
import FBSDKLoginKit

final class UserLoginManager {
    
    private let googleClientID: String = "615397119216-nvgj2f2p9a1n1c326lo2hlftcguol2m2.apps.googleusercontent.com"
    
    private lazy var configuration: GIDConfiguration = {
        return GIDConfiguration(clientID: googleClientID)
    }()
    
    static let shared = UserLoginManager()
    private init() { }
    
    func setUser(profileImage: String?, name: String?, email: String?) {
        let user = User()
        user.profileImage = profileImage ?? ""
        user.name = name ?? "익명"
        user.email = email ?? ""
        
        let realm = try! Realm()
        try! realm.write {
            realm.delete(realm.objects(User.self))
            realm.add(user)
        }
    }
    
    func deleteUser() {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(realm.objects(User.self))
        }
    }
}

// Facebook Login
extension UserLoginManager {
    func doLoginFacebook() {
        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {
            print("There is no root view controller!")
            return
        }
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile", "email", "name"], from: rootViewController) { result, error in
            if let error = error {
                print("Encountered Erorr: \(error)")
            } else if let result = result, result.isCancelled {
                print("Cancelled")
            } else {
                Profile.loadCurrentProfile { profile, error in
                    self.setUser(
                        profileImage: profile?.imageURL?.absoluteString,
                        name: profile?.name,
                        email: profile?.email
                    )
                }
            }
        }
    }
    
    func doLogoutFacebook() {
        let loginManager = LoginManager()
        loginManager.logOut()
    }
}

// Google Login
extension UserLoginManager {
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
            
            self.setUser(
                profileImage: socialUser.profile?.imageURL(withDimension: 320)?.absoluteString,
                name: socialUser.profile?.name,
                email: socialUser.profile?.email
            )
        }
    }
    
    func doLogoutGoogle() {
        GIDSignIn.sharedInstance.signOut()
        
        deleteUser()
    }
}
