//
//  VoteResultView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/05.
//

import SwiftUI

struct VoteResultView: View {
    var place: Place = placeDummy
    var body: some View {
        VStack {
            Text("투표 결과")
                .font(NotoSans.bold(size: 30))
            Spacer()
            PlaceCardView(place: place)
            Spacer()
            GeometryReader { proxy in
                HStack(spacing: 10) {
                    Button(action: {
                        
                    }, label: {
                        Text("재투표하기")
                            .padding()
                            .font(NotoSans.regular(size: 16))
                            .frame(width: proxy.size.width * 0.35)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 13)
                                    .strokeBorder(lineWidth: 1)
                                    .foregroundColor(.black)
                            )
                            .cornerRadius(13)
                    })
                    Button(action: {
                        
                    }, label: {
                        Text("홈으로")
                            .padding()
                            .font(NotoSans.regular(size: 16))
                            .frame(width: proxy.size.width * 0.65 - 10)
                            .foregroundColor(.white)
                            .background(Color.gray)
                            .cornerRadius(13)
                    })
                }
            }
            .frame(height: 55)
        }
        .padding()
    }
}

struct VoteResultView_Previews: PreviewProvider {
    static var previews: some View {
        VoteResultView()
    }
}
