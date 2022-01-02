//
//  Place.swift
//  ThatsIt
//
//  Created by 구형모 on 2022/01/02.
//

import Foundation
import SwiftUI

struct Place {
    var name: String
    var description: String
    var image: String
    var location: String
    var category: Category
    var rank: Int
    var menus: [Menu]
    
}

struct Menu {
    var image: String
    var name: String
    var description: String
}

enum Category: String, CaseIterable {
    case korean = "한식"
    case japanese = "일식"
    case chinese = "중식"
    case western = "양식"
    case buffet = "뷔페"
    case pub = "주점"
}
