//
//  PlaceCardView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/04.
//

import SwiftUI
import Kingfisher

struct PlaceCardView: View {
    
    var place: Place
    
    var body: some View {
        VStack {
            KFImage.url(URL(string: place.image))
                .resizable()
                .frame(height: 350)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(place.name)
                        .font(NotoSans.bold(size: 21))
                        .lineLimit(1)
                    Text("\(place.location) | \(place.category.rawValue)")
                        .font(NotoSans.regular(size: 13))
                }
                .layoutPriority(100)
                
                Spacer()
            }
            .padding()
        }
        .background(
            Color.white
        )
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}

struct PlaceCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceCardView(place: placeDummy)
    }
}
