//
//  VoteResultView.swift
//  ThatsIt
//
//  Created by 구형모 on 2022/01/05.
//

import SwiftUI

struct VoteResultView: View {
    var place: Place = placeDummy
    var body: some View {
        VStack {
            Spacer()
            PlaceCardView(place: place)
            Spacer()
            GeometryReader { proxy in
                HStack(spacing: 10) {
                    Button(action: {
                        
                    }, label: {
                        Text("재투표하기")
                            .padding()
                            .frame(width: proxy.size.width * 0.3)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 13)
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(.black)
                            )
                            .cornerRadius(13)
                    })
                    Button(action: {
                        
                    }, label: {
                        Text("홈으로")
                            .padding()
                            .frame(width: proxy.size.width * 0.7 - 10)
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
