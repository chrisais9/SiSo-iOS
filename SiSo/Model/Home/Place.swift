//
//  Place.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/02.
//

import Foundation
import SwiftUI

struct Place: Codable, Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(coordinates.latitude)
        hasher.combine(coordinates.longitude)
    }
    static func == (lhs: Place, rhs: Place) -> Bool {
        return lhs.name == rhs.name && lhs.coordinates == rhs.coordinates
    }
    
    
    var name: String
    var description: String
    var image: String
    var location: String
    var category: Category
    var menus: [Menu]
    
    var coordinates: Coordinates
    
    struct Coordinates: Codable, Equatable {
        var latitude: Double
        var longitude: Double
    }
}

struct Menu: Codable {
    var image: String
    var name: String
    var description: String
}

enum Category: String, CaseIterable, Codable {
    case korean = "한식"
    case japanese = "일식"
    case chinese = "중식"
    case western = "양식"
    case buffet = "뷔페"
    case pub = "주점"
}

var placeDummy: Place {
    placesDummy.first!
}

let placesDummy: [Place] = [
    Place(
        name: "본보야지",
        description: "최고등급의 한우와 한돈만을 숙성하여 판매하는 숯불구이 전문점입니다.",
        image: "https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20180919_13%2F1537334853345O2bsh_JPEG%2FGQiNDnJMqcJsM8vkI-WGBc4T.JPG.jpg",
        location: "강남구",
        category: .western,
        menus: [
            Menu(
                image: "https://ldb-phinf.pstatic.net/20210727_100/1627374983520dB6Hs_JPEG/image.jpg",
                name: "스파이시 새우 크림 파스타",
                description: ""),
            Menu(
                image: "https://ldb-phinf.pstatic.net/20210727_177/162737500123145s4v_JPEG/image_%282%29.jpg",
                name: "한우 큐브 스테이크",
                description: "국내산 한우 180g"),
            Menu(
                image: "https://ldb-phinf.pstatic.net/20210727_201/1627374974197VBw2X_JPEG/image_%281%29.jpg",
                name: "잠봉 부르스케타",
                description: ""),
            Menu(
                image: "",
                name: "마르게리따",
                description: ""),
            Menu(
                image: "",
                name: "수비드한 문어 꼬치",
                description: ""),
            Menu(
                image: "",
                name: "오늘의 스프",
                description: "")
        ],
        coordinates: Place.Coordinates(latitude: 37.524075486, longitude: 126.927374324)
    ),
    Place(
        name: "오복수산 여의도점",
        description: "오복수산 여의도점은 타 지점과 달리 모듬스시가 판매되고 있습니다",
        image: "https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20201123_234%2F1606088369071MRBEQ_JPEG%2F0YkoxDH6sepa4QqpzU5rfgIS.jpg",
        location: "강남구",
        category: .western,
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
        ],
        coordinates: Place.Coordinates(latitude: 37.52439446, longitude: 126.927374324)
    ),
    Place(
        name: "콘래드서울 제스트",
        description: "제스트는 아침, 점심, 저녁 식사가 가능한 뷔페입니다",
        image: "https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210423_99%2F1619140686159kzdz9_JPEG%2Fcon200529_510.jpg",
        location: "강남구",
        category: .western,
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
        ],
        coordinates: Place.Coordinates(latitude: 37.52439446, longitude: 126.927148809)
    ),
    Place(
        name: "더 스테이크 하우스 여의도 IFC점",
        description: "더스테이크하우스에서 홀그레인소스를 곁들인 채끝스테이크",
        image: "https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20191017_267%2F1571278507861earXq_JPEG%2F012_%25BD%25BA%25C5%25D7%25C0%25CC%25C5%25A9%25C7%25CF%25BF%25EC%25BD%25BA_%25C0%25CD%25BD%25BA%25C5%25D7%25B8%25AE%25BE%25EE_20191010_%25BF%25F8%25BA%25BB_VMU.jpg",
        location: "강남구",
        category: .western,
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
        ],
        coordinates: Place.Coordinates(latitude: 37.524630733, longitude: 126.92748643)
    )
]
