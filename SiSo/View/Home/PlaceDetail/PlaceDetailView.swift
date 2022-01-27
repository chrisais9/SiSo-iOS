//
//  PlaceDetailView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/02.
//

import SwiftUI
import Kingfisher

struct PlaceDetailView: View {
    
    var place: Place
    
    var body: some View {
        VStack {
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
                }
                
                Spacer()
                    .frame(height: 150)
                Text("\(place.description)")
                    .font(NotoSans.regular(size: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .background(
                KFImage.url(URL(string: place.image))
                    .resizable()
                    .opacity(0.7)
            )
            Text("'\(place.name)'의 대표메뉴")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(NotoSans.bold(size: 17))
                .padding(.horizontal)
                .padding(.top)
            ScrollView {
                VStack {
                    ForEach(place.menus, id: \.name) { menu in
                        PlaceMenuRow(image: menu.image, name: menu.name, description: menu.description)
                            .padding(.horizontal)
                    }
                }
            }
        }
        //        .navigationTitle(place.name)
        //        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailView(place: placeDummy)
    }
}
