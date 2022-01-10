//
//  RestaurantListView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/10.
//

import SwiftUI

struct RestaurantListView: View {
    var body: some View {
        LazyVStack {
            RestaurantCardView(images1: "https://www.gyeongju.go.kr/upload/content/thumb/20200429/83B53EE41B9D4C2A88B5D439022943A8.jpg", images2: "https://www.gyeongju.go.kr/upload/content/thumb/20191211/A5E16B2009A741B3B54A228BFA0518D9.jpg", images3: "https://t1.daumcdn.net/cfile/tistory/99EA6D505C6D4A4D2C", title: "김부장이 추천하는 베트남 맛집", likes: "1,201", distance: "0.8")
        }
        .padding()
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
    }
}
