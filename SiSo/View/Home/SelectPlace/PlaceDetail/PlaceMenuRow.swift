//
//  PlaceMenuRow.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/02.
//

import SwiftUI
import Kingfisher

struct PlaceMenuRow: View {
    
    var image: String
    var name: String
    var description: String
    
    var body: some View {
        HStack {
            KFImage.url(URL(string: image))
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(8)
            VStack(spacing: 6) {
                Text(name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(NotoSans.bold(size: 17))
                Text(description)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(NotoSans.regular(size: 13))
                    .foregroundColor(.gray)
            }
        }
    }
}

struct PlaceMenuRow_Previews: PreviewProvider {
    static var previews: some View {
        PlaceMenuRow(image: "https://blog.kakaocdn.net/dn/nBCKV/btqBE1JKegR/HHZIH590KCsqlxZRd0DlKK/img.png", name: "숙성 눈꽃살", description: "부드러운 숙성 소고기, 눈꽃을 닮아서 눈꽃살임")
    }
}
