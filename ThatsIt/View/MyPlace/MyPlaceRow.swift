//
//  MyPlaceRow.swift
//  ThatsIt
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
                .frame(width: 100, height: 100)
                
                
            VStack(alignment: .leading) {
                Spacer()
                Text("장소 명")
                    .bold()
                Spacer()
                Text("성동구 | 양식")
                    .font(.caption)
                Spacer()
            }
            
            Spacer()
            VStack {
                Image(systemName: "bookmark.fill")
                Text("57")
                    .bold()
                Spacer()
            }
        }
        .frame(width: .infinity, height: 100)
    }
}

struct MyPlaceRow_Previews: PreviewProvider {
    static var previews: some View {
        MyPlaceRow()
    }
}
