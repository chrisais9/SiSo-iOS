//
//  FilterHeaderView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/01.
//

import SwiftUI

struct FilterHeaderView: View {
    
    @ObservedObject var selectedFilter: SelectedFilters

    @State var filters: [String] = []
    
    var body: some View {
        VStack(spacing: 13) {
            
            Text("서울시 동작구 상도동")
                .font(NotoSans.bold(size: 19))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                ForEach(filters, id: \.self) { value in
                    Text(value)
                        .font(NotoSans.regular(size: 15))
                        .foregroundColor(.appPrimary)
                        .padding(.horizontal, 10)
                        .overlay(
                            Capsule()
                                .stroke()
                                .foregroundColor(.black.opacity(0.2))
                        )
                    
                }
                Spacer()
            }
            
            Divider()
            
            Text("총 10개")
                .font(NotoSans.regular(size: 15))
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .onAppear {
            let selectedFilters: [String?] = [
                selectedFilter.range?.rawValue,
                selectedFilter.category?.rawValue,
                selectedFilter.price?.rawValue,
                selectedFilter.parking?.rawValue
            ]
            // append not null
            filters.append(contentsOf: selectedFilters.compactMap {$0})
        }
    }
}

struct FilterHeaderView_Previews: PreviewProvider {
    
    static var previews: some View {
        let selectedFilter = SelectedFilters()
        selectedFilter.range = .km1
        selectedFilter.price = .around10000
        return FilterHeaderView(selectedFilter: selectedFilter)
    }
}
