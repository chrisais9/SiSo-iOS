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
        ScrollView {
            VStack {
                PlaceDetailPlaceCard(place: place)
                    .padding()
                    .frame(height: 400)
                StyledText("\(place.name)의 대표메뉴")
                    .style(.highlight(color: .appPrimary), ranges: { [$0.range(of: place.name)!] })
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .font(NotoSans.bold(size: 17))
                ForEach(place.menus, id: \.name) { menu in
                    VStack {
                        Divider()
                        PlaceMenuRow(image: menu.image, name: menu.name, description: menu.description)
                            .frame(height: 100)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(place.name)
    }
}

struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PlaceDetailView(place: placesDummy[0])
        }
    }
}
