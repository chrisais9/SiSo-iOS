//
//  VoteView.swift
//  ThatsIt
//
//  Created by 구형모 on 2022/01/03.
//

import SwiftUI


var width = UIScreen.main.bounds.width
struct VoteView: View {
    
    var body: some View {
        VStack {
            Text("투표 진행중이에요")
                .font(NotoSans.bold(size: 27))
            HStack {
                Text("선택완료")
                    .font(NotoSans.regular(size: 9))
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        Circle()
                            .foregroundColor(.gray)
                    )
                Text("선택완료")
                    .font(NotoSans.regular(size: 9))
                    .padding()
                    .foregroundColor(.white)
                    .background(
                        Circle()
                            .foregroundColor(.gray)
                    )
                Text("선택완료")
                    .font(NotoSans.regular(size: 9))
                    .padding()
                    .foregroundColor(.white)
                    .background(
                        Circle()
                            .foregroundColor(.gray)
                    )
                Text("선택완료")
                    .font(NotoSans.regular(size: 9))
                    .padding()
                    .foregroundColor(.white)
                    .background(
                        Circle()
                            .foregroundColor(.gray)
                    )
            }
        }
    }
}

struct VoteView_Previews: PreviewProvider {
    static var previews: some View {
        VoteView()
    }
}
