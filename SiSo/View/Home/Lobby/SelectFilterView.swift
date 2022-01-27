//
//  SelectFilterView.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/23.
//

import SwiftUI

struct SelectFilterView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let columns4: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    let columns3: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    let columns2: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    @ObservedObject var selectedFilters: SelectedFilters
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 30) {
                    
                    Text("필터를 선택해주세요.")
                        .font(NotoSans.regular(size: 21))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider()
                    
                    VStack {
                        
                        Text("반경")
                            .font(NotoSans.bold(size: 17))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        LazyVGrid(columns: columns4) {
                            ForEach(FilterRange.allCases, id: \.self) { range in
                                Button {
                                    selectedFilters.range = range
                                } label: {
                                    if selectedFilters.range == range {
                                        Capsule()
                                            .strokeBorder()
                                            .foregroundColor(.appPrimary)
                                            .overlay(
                                                Text(range.rawValue)
                                                    .font(NotoSans.regular(size: 17))
                                                    .foregroundColor(.appPrimary)
                                            )
                                    }
                                    else {
                                        Capsule()
                                            .fill(.gray.opacity(0.2))
                                            .overlay(
                                                Text(range.rawValue)
                                                    .font(NotoSans.regular(size: 17))
                                                    .foregroundColor(.gray)
                                            )
                                        
                                    }
                                }.frame(height: 40)
                            }
                        }
                    }
                    
                    VStack {
                        
                        Text("음식 종류")
                            .font(NotoSans.bold(size: 17))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        LazyVGrid(columns: columns4) {
                            ForEach(Category.allCases, id: \.self) { category in
                                Button {
                                    selectedFilters.category = category
                                } label: {
                                    if selectedFilters.category == category {
                                        Capsule()
                                            .strokeBorder()
                                            .foregroundColor(.appPrimary)
                                            .overlay(
                                                Text(category.rawValue)
                                                    .font(NotoSans.regular(size: 17))
                                                    .foregroundColor(.appPrimary)
                                            )
                                    }
                                    else {
                                        Capsule()
                                            .fill(.gray.opacity(0.2))
                                            .overlay(
                                                Text(category.rawValue)
                                                    .font(NotoSans.regular(size: 17))
                                                    .foregroundColor(.gray)
                                            )
                                        
                                    }
                                }.frame(height: 40)
                                
                            }
                        }
                    }
                    
                    VStack {
                        
                        Text("가격 / 1인당")
                            .font(NotoSans.bold(size: 17))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        LazyVGrid(columns: columns3) {
                            ForEach(Price.allCases, id: \.self) { price in
                                Button {
                                    selectedFilters.price = price
                                } label: {
                                    if selectedFilters.price == price {
                                        Capsule()
                                            .strokeBorder()
                                            .foregroundColor(.appPrimary)
                                            .overlay(
                                                Text(price.rawValue)
                                                    .font(NotoSans.regular(size: 17))
                                                    .foregroundColor(.appPrimary)
                                            )
                                    }
                                    else {
                                        Capsule()
                                            .fill(.gray.opacity(0.2))
                                            .overlay(
                                                Text(price.rawValue)
                                                    .font(NotoSans.regular(size: 17))
                                                    .foregroundColor(.gray)
                                            )
                                        
                                    }
                                }.frame(height: 40)
                                
                            }
                        }
                    }
                    
                    VStack {
                        
                        Text("주차 여부")
                            .font(NotoSans.bold(size: 17))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        LazyVGrid(columns: columns2) {
                            ForEach(Parking.allCases, id: \.self) { parking in
                                Button {
                                    selectedFilters.parking = parking
                                } label: {
                                    if selectedFilters.parking == parking {
                                        Capsule()
                                            .strokeBorder()
                                            .foregroundColor(.appPrimary)
                                            .overlay(
                                                Text(parking.rawValue)
                                                    .font(NotoSans.regular(size: 17))
                                                    .foregroundColor(.appPrimary)
                                            )
                                    }
                                    else {
                                        Capsule()
                                            .fill(.gray.opacity(0.2))
                                            .overlay(
                                                Text(parking.rawValue)
                                                    .font(NotoSans.regular(size: 17))
                                                    .foregroundColor(.gray)
                                            )
                                        
                                    }
                                }.frame(height: 40)
                                
                            }
                        }
                    }
                }
                
            }
            
            LargeButton(title: "필터 적용", backgroundColor: .appPrimary, foregroundColor: .white) {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        .padding(.horizontal)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    selectedFilters.reset()
                } label: {
                    Text("초기화")
                        .font(NotoSans.regular(size: 17))
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct SelectFilterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SelectFilterView(selectedFilters: SelectedFilters())
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
