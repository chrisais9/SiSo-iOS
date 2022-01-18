//
//  API.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/17.
//

import Foundation
import Alamofire
import RealmSwift

class API {
    private init() {}
    
    static let shared: API = API()
    
    let base_url = "https://api.playground.party"
//    let base_url = "http://192.168.0.30:3000"
    
    func getHeaders(withAuthorization: Bool = false) -> HTTPHeaders? {
        var headers: HTTPHeaders = [
            "content-language": Locale.preferredLanguages.first ?? "ko-KR",
            "platform": "ios"
        ]
        // 로그인 권한이 필요한 REST api는 JwtToken append
        if withAuthorization {
            let realm = try! Realm()
            if let jwtToken = realm.objects(User.self).first?.jwtToken {
                headers.add(HTTPHeader(name: "Authorization", value: jwtToken))
            }
        }
        
        return headers
    }
}
