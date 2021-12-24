//
//  SelectFilterView.swift
//  ThatsIt
//
//  Created by 구형모 on 2021/12/23.
//

import SwiftUI

struct SelectFilterView: View {
    let columns4: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let columns3: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let columns2: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    @ObservedObject var selectedFilters: SelectedFilters
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            Text("필터를 선택해주세요.")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Group {
                Spacer()
                    .frame(height: 40)
                
                Text("반경")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                LazyVGrid(columns: columns4) {
                    ForEach(Range.allCases, id: \.self) { range in
                        Button {
                            selectedFilters.range = range
                        } label: {
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(lineWidth: range == selectedFilters.range ? 3 : 1)
                                .frame(width: 78, height: 40)
                                .overlay(
                                    Text(range.rawValue)
                                )
                                .foregroundColor(.black)
                        }

                    }
                }
            }
            
            Group {
                Spacer()
                    .frame(height: 40)
                
                Text("음식 종류")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                LazyVGrid(columns: columns4) {
                    ForEach(Category.allCases, id: \.self) { category in
                        Button {
                            selectedFilters.category = category
                        } label: {
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(lineWidth: category == selectedFilters.category ? 3 : 1)
                                .frame(width: 78, height: 40)
                                .overlay(
                                    Text(category.rawValue)
                                )
                                .foregroundColor(.black)
                        }

                    }
                }
            }
            
            Group {
                Spacer()
                    .frame(height: 40)
                
                Text("가격 / 1인당")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                LazyVGrid(columns: columns3) {
                    ForEach(Price.allCases, id: \.self) { price in
                        Button {
                            selectedFilters.price = price
                        } label: {
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(lineWidth: price == selectedFilters.price ? 3 : 1)
                                .frame(width: 108, height: 40)
                                .overlay(
                                    Text(price.rawValue)
                                )
                                .foregroundColor(.black)
                        }

                    }
                }
            }
            
            Group {
                Spacer()
                    .frame(height: 40)
                
                Text("가격 / 1인당")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                LazyVGrid(columns: columns2) {
                    ForEach(Parking.allCases, id: \.self) { parking in
                        Button {
                            selectedFilters.parking = parking
                        } label: {
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(lineWidth: parking == selectedFilters.parking ? 3 : 1)
                                .frame(width: 160, height: 40)
                                .overlay(
                                    Text(parking.rawValue)
                                )
                                .foregroundColor(.black)
                        }

                    }
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct SelectFilterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SelectFilterView(selectedFilters: SelectedFilters())
        }
    }
}
