//
//  DeckPlaceRow.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/24.
//

import SwiftUI
import Kingfisher

struct DeckPlaceRow: View {
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

struct DeckPlaceRow_Previews: PreviewProvider {
    static var previews: some View {
        PlaceMenuRow(image: "https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20191017_267%2F1571278507861earXq_JPEG%2F012_%25BD%25BA%25C5%25D7%25C0%25CC%25C5%25A9%25C7%25CF%25BF%25EC%25BD%25BA_%25C0%25CD%25BD%25BA%25C5%25D7%25B8%25AE%25BE%25EE_20191010_%25BF%25F8%25BA%25BB_VMU.jpg", name: "더 스테이크 하우스 여의도 IFC점", description: "더스테이크하우스에서 홀그레인소스를 곁들인 채끝스테이크")
    }
}
