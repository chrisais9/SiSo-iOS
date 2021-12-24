//
//  PreviousLocationRow.swift
//  ThatsIt
//
//  Created by 구형모 on 2021/12/23.
//

import SwiftUI

struct PreviousLocationRow: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("9월 30일")
                .font(.caption)
            Text("장소 명")
                .font(.title3)
                .bold()
            Text("성동구 성수 2가")
                .font(.caption)
            Spacer()
                .frame(height: 20)
        }
        .padding()
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
