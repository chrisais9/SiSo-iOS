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
            Spacer()
            VoteResultCardView(place: place)
                .padding(.vertical, 30)
            Spacer()
            GeometryReader { proxy in
                HStack(spacing: 10) {
                    SisoWhiteButton(title: "재투표 하기") {
                        
                    }
                    .frame(width: proxy.size.width * 0.35)
                    LargeButton(title: "홈으로", backgroundColor: .appPrimary, foregroundColor: .white) {
                        
                    }
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
