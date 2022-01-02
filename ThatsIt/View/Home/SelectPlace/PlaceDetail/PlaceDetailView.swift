//
//  PlaceDetailView.swift
//  ThatsIt
//
//  Created by 구형모 on 2022/01/02.
//

import SwiftUI
import SDWebImageSwiftUI

struct PlaceDetailView: View {
    
    var place: Place = Place(
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
    
    var body: some View {
        ScrollView {
            VStack(spacing: 3) {
                HStack {
                    Text("\(place.location) | \(place.category.rawValue)")
                        .font(NotoSans.regular(size: 13))
                    Spacer()
                    ForEach(0..<4) { _ in
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.black.opacity(0.7))
                    }
                }
                HStack {
                    Text("\(place.name)")
                        .font(NotoSans.bold(size: 19))
                    Spacer()
                    Text("\(place.rank)순위")
                        .font(NotoSans.bold(size: 23))
                    
                }
                Spacer()
                    .frame(height: 150)
                Text("\(place.description)")
                    .font(NotoSans.regular(size: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .background(
                WebImage(url: URL(string: place.image))
                    .resizable()
                    .opacity(0.7)
            )
            Text("'\(place.name)'의 대표메뉴")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(NotoSans.bold(size: 17))
                .padding(.horizontal)
                .padding(.top)
            ForEach(place.menus, id: \.name) { menu in
                PlaceMenuRow(image: menu.image, name: menu.name, description: menu.description)
                    .padding(.horizontal)
            }
        }
        .navigationTitle(place.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PlaceDetailView()
        }
    }
}
