//
//  API.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/17.
//

import Foundation
import Alamofire

class API {
    private init() {}
    
    static let shared: API = API()
    
//    let base_url = "https://api.playground.party/"
    let base_url = "http://192.168.0.30:3000"
    
    func getHeaders(_ withAuthorization: Bool = false) -> HTTPHeaders? {
        let headers: HTTPHeaders = [
            "content-language": Locale.preferredLanguages.first ?? "ko-KR",
            "platform": "ios"
        ]
        return headers
    }
}
