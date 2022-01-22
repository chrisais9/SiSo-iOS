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
    func loginWithSocialToken(type: LoginType, token: String, completion: @escaping (HTTPStatusCode, LoginResponse?)->Void) {
        AF.request(
            "\(baseUrl)/auth/login",
            method: .post,
            parameters: ["type":type.rawValue, "token":token],
            headers: API.shared.getHeaders()
        ).responseDecodable(of: LoginResponse.self) { response in
            if let statusCode = response.response?.statusCode {
                completion(HTTPStatusCode.init(rawValue: statusCode), response.value)
            }
        }
    }
    
    func registerWithSocialToken(type: LoginType, token: String, completion: @escaping (HTTPStatusCode, RegisterResponse?)->Void) {
        AF.request(
            "\(baseUrl)/auth/register",
            method: .post,
            parameters: ["type":type.rawValue, "token":token],
            headers: API.shared.getHeaders()
        ).responseDecodable(of: RegisterResponse.self) { response in
            if let statusCode = response.response?.statusCode {
                completion(HTTPStatusCode.init(rawValue: statusCode), response.value)
            }
        }
    }
}

// MARK:  Profile
extension Repositories {
    
    /**
     GET: 프로필 정보 가져오기
     */
    func fetchProfileInfo(completion: @escaping (HTTPStatusCode, ProfileResponse?)->Void) {
        AF.request(
            "\(baseUrl)/auth/profile",
            method: .get,
            headers: API.shared.getHeaders(withAuthorization: true)
        ).responseDecodable(of: ProfileResponse.self, decoder: ProfileResponse.ProfileResponseDecoder()) { response in
            if let statusCode = response.response?.statusCode {
                print("profile1")
                completion(HTTPStatusCode.init(rawValue: statusCode), response.value)
            }
        }
    }
    
    /**
     POST: 프로필 이미지 업로드(변경)
     */
    func uploadProfileImage(image: UIImage, completion: @escaping (HTTPStatusCode, SimpleDummyResponse?)-> Void) {
        guard let jpegData = image.resizeImage(targetSize: .init(width: 256, height: 256)).jpegData(compressionQuality: 1),
              let to = URL(string: "\(baseUrl)/auth/profile-image") else {
                  return
              }
        
        AF.upload(
            multipartFormData: { $0.append(jpegData, withName: "file", fileName: "file.jpeg", mimeType: "image/jpeg")},
            to: to,
            usingThreshold: UInt64.init(),
            method: .post,
            headers: API.shared.getHeaders(withAuthorization: true)
        ).uploadProgress(queue: .main, closure: { progress in
            print("upload1", progress)
        }).responseDecodable(of: SimpleDummyResponse.self) { response in
            if let statusCode = response.response?.statusCode {
                completion(HTTPStatusCode.init(rawValue: statusCode), response.value)
            }
        }
    }
    
}
