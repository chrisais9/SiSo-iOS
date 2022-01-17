//
//  User.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/12.
//

import RealmSwift
import SwiftUI

enum LoginType: String, PersistableEnum {
    case none
    case google
    case kakao
    case facebook
    case naver
    case apple
}

final class User: Object, ObjectKeyIdentifiable {
    
    @Persisted var jwtToken: String = ""
    
    @Persisted var loginType: LoginType = .none
    
    @Persisted var name: String = "로그인 해주세요"
    
    @Persisted var email: String = ""
    
    @Persisted var profileImage: String = ""
}
