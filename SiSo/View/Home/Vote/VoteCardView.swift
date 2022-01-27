//
//  VoteCardView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/27.
//
import SwiftUI
import Kingfisher

struct VoteCardView: View {
    
    var place: Place
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                KFImage.url(URL(string: place.image))
                    .resizable()
                    .cornerRadius(17)
            }
            .padding()
            
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
        .background(Color.white)
        .cornerRadius(17)
        .shadow(radius: 4)
    }
}

struct VoteCardView_Previews: PreviewProvider {
    static var previews: some View {
        VoteCardView(place: placeDummy)
    }
}
