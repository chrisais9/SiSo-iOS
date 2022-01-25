//
//  FilterPreviewView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/25.
//

import SwiftUI

struct FilterPreviewView: View {
    
    @ObservedObject var selectedFilter: SelectedFilters
    
    var body: some View {
        VStack {
            if selectedFilter.isEmpty {
                
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color(.systemGray6))
                    .overlay(
                        Text("필터를 선택해주세요")
                            .font(NotoSans.regular(size: 13))
                            .foregroundColor(.gray)
                    )
            }
            else {
                RoundedRectangle(cornerRadius: 3)
                    .strokeBorder(.black.opacity(0.1))
                    .overlay(
                        VStack(spacing: 15) {
                            if let range = selectedFilter.range {
                                HStack {
                                    Text("반경")
                                        .foregroundColor(.gray)
                                        .font(NotoSans.regular(size: 15))
                                    Spacer()
                                    Text(range.rawValue)
                                        .font(NotoSans.regular(size: 15))
                                }
                            }
                            if let category = selectedFilter.category {
                                HStack {
                                    Text("음식 종류")
                                        .foregroundColor(.gray)
                                        .font(NotoSans.regular(size: 15))
                                    Spacer()
                                    Text(category.rawValue)
                                        .font(NotoSans.regular(size: 15))
                                }
                            }
                            if let price = selectedFilter.price {
                                HStack {
                                    Text("가격")
                                        .foregroundColor(.gray)
                                        .font(NotoSans.regular(size: 15))
                                    Spacer()
                                    Text(price.rawValue)
                                        .font(NotoSans.regular(size: 15))
                                }
                            }
                            if let parking = selectedFilter.parking {
                                HStack {
                                    Text("주차")
                                        .foregroundColor(.gray)
                                        .font(NotoSans.regular(size: 15))
                                    Spacer()
                                    Text(parking.rawValue)
                                        .font(NotoSans.regular(size: 15))
                                }
                                
                            }
                        }.padding()
                    )
            }
        }
        .frame(height: 200)
    }
}

struct FilterPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        FilterPreviewView(selectedFilter: SelectedFilters())
    }
}
