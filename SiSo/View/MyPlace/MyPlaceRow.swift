//
//  MyPlaceRow.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyPlaceRow: View {
    
    var preview: String = "https://www.noodlelovers.com/upload_data/m_product_noodle_set/shutterstock_543369610.jpg"
//    var name: String
//    var location: String
//    var category: Category
//    var bookmarks: String
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: preview))
                .resizable()
                .placeholder {
                    Rectangle().foregroundColor(.gray)
                }
                .cornerRadius(10)
                .frame(width: 150, height: 150)
                
                
            VStack(alignment: .leading) {
                Spacer()
                Text("장소 명")
                    .font(NotoSans.bold(size: 17))
                Spacer()
                Text("성동구 | 양식")
                    .font(NotoSans.regular(size: 13))
                Spacer()
            }
            
            Spacer()
            VStack {
                Image(systemName: "bookmark.fill")
                Text("57")
                    .font(NotoSans.bold(size: 17))
                Spacer()
            }
        }
        .frame(height: 150)
    }
}

struct MyPlaceRow_Previews: PreviewProvider {
    static var previews: some View {
        MyPlaceRow()
    }
}
