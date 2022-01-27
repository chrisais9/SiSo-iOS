//
//  VoteResultCardView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/27.
//

import SwiftUI
import Kingfisher

struct VoteResultCardView: View {
    
    var place: Place = placeDummy
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                VStack {
                    HStack {
                        Text(place.name)
                            .font(NotoSans.bold(size: 21))
                            .shadow(radius: 3)
                            .foregroundColor(.white)
                        Spacer()
                        Text("1위")
                            .font(NotoSans.bold(size: 23))
                            .shadow(radius: 3)
                            .foregroundColor(.white)
                    }
                    HStack {
                        Text("\(place.location) | \(place.category.rawValue)")
                            .font(NotoSans.medium(size: 15))
                            .shadow(radius: 3)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        Text("위치확인")
                            .font(NotoSans.medium(size: 15))
                            .padding(5)
                            .background(Color.black)
                            .cornerRadius(17)
                            .foregroundColor(.appPrimary)
                    }
                }
                .padding()
                .background(
                    KFImage.url(URL(string: place.image))
                        .resizable()
                        .cornerRadius(12)
                )
            }
            .padding(.top)
            .padding(.horizontal)
            
            Text("파스타와 뇨끼, 리조또 그리고 소량호젠에서만 즐길 수 있는 메뉴를 담습니다. 직접 발효한 쌀누룩 발효소금으로 제철재료에 간을 맞추어 요리하는 레스토랑입니다.")
                .font(NotoSans.regular(size: 15))
                .foregroundColor(.black.opacity(0.7))
                .padding()
        }
        .background(Color.white)
        .cornerRadius(17)
        .shadow(radius: 4)
    }
}

struct VoteResultCardView_Previews: PreviewProvider {
    static var previews: some View {
        VoteResultCardView()
    }
}
