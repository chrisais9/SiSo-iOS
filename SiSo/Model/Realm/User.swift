//
//  User.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/12.
//

import RealmSwift
import SwiftUI

final class User: Object, ObjectKeyIdentifiable {
    
    @Persisted var isLoggedIn: Bool = false
    
    @Persisted var name: String = "로그인 해주세요"
    
    @Persisted var email: String = ""
    
    @Persisted var profileImage: String = ""
}
