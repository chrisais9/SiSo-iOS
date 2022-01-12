//
//  GoogleLoginAuthenticator.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/12.
//

import Foundation

import Foundation
import GoogleSignIn

/// An observable class for authenticating via Google.
final class GoogleLoginAuthenticator: ObservableObject {
    private let clientID: String = "615397119216-nvgj2f2p9a1n1c326lo2hlftcguol2m2.apps.googleusercontent.com"
    
    private lazy var configuration: GIDConfiguration = {
        return GIDConfiguration(clientID: clientID)
    }()
    
    private var authViewModel: AuthenticationViewModel
    
    /// Creates an instance of this authenticator.
    /// - parameter authViewModel: The view model this authenticator will set logged in status on.
    init(authViewModel: AuthenticationViewModel) {
        self.authViewModel = authViewModel
    }
    
    /// Signs in the user based upon the selected account.'
    /// - note: Successful calls to this will set the `authViewModel`'s `state` property.
    func signIn() {
        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {
            print("There is no root view controller!")
            return
        }
        GIDSignIn.sharedInstance.signIn(with: configuration,
                                        presenting: rootViewController) { user, error in
            guard let user = user else {
                print("Error! \(String(describing: error))")
                return
            }
            self.authViewModel.state = .signedIn(user)
        }
    }
    
    /// Signs out the current user.
    func signOut() {
        GIDSignIn.sharedInstance.signOut()
        authViewModel.state = .signedOut
    }
    
    /// Disconnects the previously granted scope and signs the user out.
    func disconnect() {
        GIDSignIn.sharedInstance.disconnect { error in
            if let error = error {
                print("Encountered error disconnecting scope: \(error).")
            }
            self.signOut()
        }
    }
}
