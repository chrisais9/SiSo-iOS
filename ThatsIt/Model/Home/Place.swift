//
//  Place.swift
//  ThatsIt
//
//  Created by 구형모 on 2022/01/02.
//

import Foundation
import SwiftUI

struct Place: Identifiable {
    
    var id = UUID()
    
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

var placesDummy: [Place] = [
    Place(
        name: "네모집 청담점",
        description: "최고등급의 한우와 한돈만을 숙성하여 판매하는 숯불구이 전문점입니다.",
        image: "https://emmaru.com/matzip/include/pics/2018/02/19/m_66299P122516_1.jpg",
        location: "강남구",
        category: .western,
        rank: 2,
        menus: [
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임")
        ]
    ),
    Place(
        name: "네모집 청담점",
        description: "최고등급의 한우와 한돈만을 숙성하여 판매하는 숯불구이 전문점입니다.",
        image: "https://emmaru.com/matzip/include/pics/2018/02/19/m_66299P122516_1.jpg",
        location: "강남구",
        category: .western,
        rank: 2,
        menus: [
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임")
        ]
    ),
    Place(
        name: "네모집 청담점",
        description: "최고등급의 한우와 한돈만을 숙성하여 판매하는 숯불구이 전문점입니다.",
        image: "https://emmaru.com/matzip/include/pics/2018/02/19/m_66299P122516_1.jpg",
        location: "강남구",
        category: .western,
        rank: 2,
        menus: [
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임")
        ]
    ),
    Place(
        name: "네모집 청담점",
        description: "최고등급의 한우와 한돈만을 숙성하여 판매하는 숯불구이 전문점입니다.",
        image: "https://emmaru.com/matzip/include/pics/2018/02/19/m_66299P122516_1.jpg",
        location: "강남구",
        category: .western,
        rank: 2,
        menus: [
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임")
        ]
    ),
    Place(
        name: "네모집 청담점",
        description: "최고등급의 한우와 한돈만을 숙성하여 판매하는 숯불구이 전문점입니다.",
        image: "https://emmaru.com/matzip/include/pics/2018/02/19/m_66299P122516_1.jpg",
        location: "강남구",
        category: .western,
        rank: 2,
        menus: [
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임")
        ]
    ),
    Place(
        name: "네모집 청담점",
        description: "최고등급의 한우와 한돈만을 숙성하여 판매하는 숯불구이 전문점입니다.",
        image: "https://emmaru.com/matzip/include/pics/2018/02/19/m_66299P122516_1.jpg",
        location: "강남구",
        category: .western,
        rank: 2,
        menus: [
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임")
        ]
    ),
    Place(
        name: "네모집 청담점",
        description: "최고등급의 한우와 한돈만을 숙성하여 판매하는 숯불구이 전문점입니다.",
        image: "https://emmaru.com/matzip/include/pics/2018/02/19/m_66299P122516_1.jpg",
        location: "강남구",
        category: .western,
        rank: 2,
        menus: [
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임")
        ]
    ),
    Place(
        name: "네모집 청담점",
        description: "최고등급의 한우와 한돈만을 숙성하여 판매하는 숯불구이 전문점입니다.",
        image: "https://emmaru.com/matzip/include/pics/2018/02/19/m_66299P122516_1.jpg",
        location: "강남구",
        category: .western,
        rank: 2,
        menus: [
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임")
        ]
    ),
    Place(
        name: "네모집 청담점",
        description: "최고등급의 한우와 한돈만을 숙성하여 판매하는 숯불구이 전문점입니다.",
        image: "https://emmaru.com/matzip/include/pics/2018/02/19/m_66299P122516_1.jpg",
        location: "강남구",
        category: .western,
        rank: 2,
        menus: [
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임")
        ]
    ),
    Place(
        name: "네모집 청담점",
        description: "최고등급의 한우와 한돈만을 숙성하여 판매하는 숯불구이 전문점입니다.",
        image: "https://emmaru.com/matzip/include/pics/2018/02/19/m_66299P122516_1.jpg",
        location: "강남구",
        category: .western,
        rank: 2,
        menus: [
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임")
        ]
    ),
    Place(
        name: "네모집 청담점",
        description: "최고등급의 한우와 한돈만을 숙성하여 판매하는 숯불구이 전문점입니다.",
        image: "https://emmaru.com/matzip/include/pics/2018/02/19/m_66299P122516_1.jpg",
        location: "강남구",
        category: .western,
        rank: 2,
        menus: [
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임"),
            Menu(
                image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png",
                name: "숙성 눈꽃살",
                description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임")
        ]
    )
    
]
