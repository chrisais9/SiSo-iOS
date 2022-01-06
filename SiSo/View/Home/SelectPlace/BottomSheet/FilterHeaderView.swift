//
//  FilterHeaderView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/01.
//

import SwiftUI

struct FilterHeaderView: View {
    var body: some View {
        VStack {
            HStack {
                Text("성동구 성수 2가")
                    .font(NotoSans.bold(size: 19))
                Spacer()
                Text("총 10개")
                    .font(NotoSans.regular(size: 19))
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("1km")
                    .font(NotoSans.regular(size: 15))
                    .padding(2)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke()
                    )
                Text("한식")
                    .font(NotoSans.regular(size: 15))
                    .padding(2)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke()
                    )
                Text("만원 이하")
                    .font(NotoSans.regular(size: 15))
                    .padding(2)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke()
                    )
                Text("상관 없음")
                    .font(NotoSans.regular(size: 15))
                    .padding(2)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke()
                    )
                Spacer()
            }
        }
    }
}

struct FilterHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FilterHeaderView()
    }
}
