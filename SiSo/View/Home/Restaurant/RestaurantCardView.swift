//
//  RestaurantCardView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/10.
//

import SwiftUI
import Kingfisher

struct RestaurantCardView: View {
    
    var images1: String
    var images2: String
    var images3: String
    
    var title: String
    var likes: String
    var distance: String
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                HStack(spacing: 0) {
                    KFImage(URL(string: images1))
                        .resizable()
                        .scaledToFit()
                        .frame(width: proxy.size.width * 0.7)
                    VStack(spacing: 0) {
                        KFImage(URL(string: images2))
                            .resizable()
                            .scaledToFit()
                        Divider()
                        KFImage(URL(string: images3))
                            .resizable()
                            .scaledToFit()
                    }
                }
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
                    Text("거리: \(distance)km")
                }
                .padding(.horizontal)
            }
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 4)
        }
    }
}


struct RestaurantCardView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCardView(images1: "https://www.gyeongju.go.kr/upload/content/thumb/20200429/83B53EE41B9D4C2A88B5D439022943A8.jpg", images2: "https://www.gyeongju.go.kr/upload/content/thumb/20191211/A5E16B2009A741B3B54A228BFA0518D9.jpg", images3: "https://t1.daumcdn.net/cfile/tistory/99EA6D505C6D4A4D2C", title: "김부장이 추천하는 베트남 맛집", likes: "1,201", distance: "0.8")
    }
}
