//
//  MyPlaceRow.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/25.
//

import SwiftUI
import Kingfisher

struct MyPlaceRow: View {
    
    var place: Place
    
    var body: some View {
        HStack {
            KFImage.url(URL(string: place.image))
                .resizable()
                .placeholder {
                    Rectangle().foregroundColor(.gray)
                }
                .cornerRadius(10)
                .frame(width: 150, height: 150)
                
            VStack(alignment: .leading) {
                Spacer()
                Text(place.name)
                    .font(NotoSans.bold(size: 17))
                Spacer()
                Text(place.location)
                    .font(NotoSans.regular(size: 13))
                Spacer()
            }
            
            Spacer()
            VStack {
                Image(systemName: "bookmark.fill")
                Text("57")
                    .font(NotoSans.bold(size: 17))
                Spacer()
            }
        }
        .frame(height: 150)
    }
}

struct MyPlaceRow_Previews: PreviewProvider {
    static var previews: some View {
        MyPlaceRow(place: placeDummy)
    }
}
