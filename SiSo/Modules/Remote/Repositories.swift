//
//  Repositories.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/17.
//

import Foundation
import Alamofire

class Repositories {
    private init() {}
    static let shared = Repositories()
    
    private let baseUrl = API.shared.base_url
}


// MARK: Auth
extension Repositories {
    
    /// 소셜 로그인으로 부터 받은 토큰으로 서버에 로그인 요청
    ///
    /// - Parameters:
    ///   - type:          `LoginType` ex) kakao, google
    ///   - token:          소셜 로그인으로 부터 발급받은 access 토큰
    ///
    /// - Returns:         `LoginResponse`
    func loginWithSocialToken(type: LoginType, token: String, completion: @escaping (HTTPStatusCode, LoginResponse)->Void) {
        
        AF.request(
            "\(baseUrl)/auth/login",
            method: .post,
            parameters: ["type":type.rawValue, "token":token],
            headers: API.shared.getHeaders()
        ).responseDecodable(of: LoginResponse.self) { response in
            if let value = response.value, let statusCode = response.response?.statusCode {
                completion(HTTPStatusCode.init(rawValue: statusCode), value)
            }
        }
    }
    
    func registerWithSocialToken(type: LoginType, token: String, completion: @escaping (HTTPStatusCode, RegisterResponse)->Void) {
        AF.request(
            "\(baseUrl)/auth/register",
            method: .post,
            parameters: ["type":type.rawValue, "token":token],
            headers: API.shared.getHeaders()
        ).responseDecodable(of: RegisterResponse.self) { response in
            if let value = response.value, let statusCode = response.response?.statusCode {
                completion(HTTPStatusCode.init(rawValue: statusCode), value)
            }
        }
    }
    
}
