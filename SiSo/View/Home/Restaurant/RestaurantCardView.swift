//
//  RestaurantCardView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/10.
//

import SwiftUI
import Kingfisher

struct RestaurantCardView: View {
    
    var image: String
    
    var title: String
    var likes: String
    var distance: String
    
    var body: some View {
        VStack {
            KFImage(URL(string: image))
                .resizable()
                .placeholder({
                    Color.gray
                })
                .fade(duration: 0.2)
                .scaledToFit()
            VStack {
                HStack {
                    Text(title)
                        .font(NotoSans.bold(size: 17))
                    Spacer()
                    Image(systemName: "hand.thumbsup.fill")
                        .foregroundColor(.orange)
                    Text("1,201")
                        .font(NotoSans.regular(size: 17))
                }
                HStack {
                    Text("거리: \(distance)km")
                        .font(NotoSans.regular(size: 13))
                        .foregroundColor(.black.opacity(0.8))
                    Spacer()
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}


struct RestaurantCardView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCardView(image: "https://www.gyeongju.go.kr/upload/content/thumb/20200429/83B53EE41B9D4C2A88B5D439022943A8.jpg", title: "김부장이 추천하는 베트남 맛집", likes: "1,201", distance: "0.8")
    }
}
