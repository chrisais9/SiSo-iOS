//
//  FilterResultView.swift
//  ThatsIt
//
//  Created by 구형모 on 2022/01/03.
//

import SwiftUI

struct FilterResultView: View {
    
    @ObservedObject var selectedFilters: SelectedFilters
    
    var body: some View {
        VStack(spacing: 21) {
            if let range = selectedFilters.range {
                VStack {
                    Text("반경")
                        .font(NotoSans.bold(size: 15))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(range.rawValue)
                        .font(NotoSans.regular(size: 15))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            if let category = selectedFilters.category {
                VStack {
                    Text("음식종류")
                        .font(NotoSans.bold(size: 15))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(category.rawValue)
                        .font(NotoSans.regular(size: 15))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
            }
            if let price = selectedFilters.price {
                VStack {
                    Text("가격대")
                        .font(NotoSans.bold(size: 15))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(price.rawValue)
                        .font(NotoSans.regular(size: 15))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            if let parking = selectedFilters.parking {
                VStack {
                    Text("주차")
                        .font(NotoSans.bold(size: 15))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(parking.rawValue)
                        .font(NotoSans.regular(size: 15))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}

struct FilterResultView_Previews: PreviewProvider {
    static var previews: some View {
        FilterResultView(selectedFilters: SelectedFilters())
    }
}
