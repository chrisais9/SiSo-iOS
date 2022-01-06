//
//  PreviousLocationRow.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/23.
//

import SwiftUI

struct PreviousLocationRow: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("9월 30일")
                .font(NotoSans.regular(size: 13))
            Text("장소 명")
                .font(NotoSans.bold(size: 17))
            Text("성동구 성수 2")
                .font(NotoSans.regular(size: 13))
            Spacer()
                .frame(height: 17)
        }
        .padding(.vertical, 10)
        .padding(.leading, 10)
        .padding(.trailing, 33)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.white)
                .shadow(color: .gray, radius: 1, x: 1, y: 1)
        )
    }
}

struct PreviousLocationRow_Previews: PreviewProvider {
    static var previews: some View {
        PreviousLocationRow()
    }
}
