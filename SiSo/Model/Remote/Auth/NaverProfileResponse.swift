//
//  NaverProfileResponse.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/13.
//

import SwiftUI
import KakaoSDKUser

struct NaverProfileResponse: Codable {
    let message: String
    let response: Response
}

struct Response: Codable {
    var email: String
    var nickname: String
    var profileImage: String
    
    enum CodingKeys: String, CodingKey {
        case email
        case nickname
        case profileImage = "profile_image"
      }
}
