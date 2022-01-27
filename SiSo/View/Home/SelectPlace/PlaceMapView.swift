//
//  PlaceMapView.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/30.
//

import SwiftUI
import BottomSheetSwiftUI

enum CustomBottomSheetPosition: CGFloat, CaseIterable {
    case top = 0.98
    case bottom = 0.18
}

struct PlaceMapView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var bottomSheetPosition: CustomBottomSheetPosition = .bottom
    @State var topBarHeight: CGFloat = .zero
    
    @ObservedObject var selectedFilter: SelectedFilters
    @State var places: [Place] = placesDummy
    
    @State var isSearchViewPresented: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                GeometryReader { proxy in
                    VStack {
                        NaverMapView()
                            .frame(height: proxy.size.height * (1 - CustomBottomSheetPosition.bottom.rawValue))
                        Spacer()
                        
                    }
                }
            }
            .ignoresSafeArea(.container, edges: .top)
            
            VStack {
                HStack {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding(12)
                            .background(
                                Circle()
                                    .fill(.white)
                                    .shadow(radius: 2)
                            )
                    }

                    Button {
                        UIView.setAnimationsEnabled(false)
                        isSearchViewPresented.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .font(NotoSans.regular(size: 15))
                                .foregroundColor(.black)
                            Text("내 현 위치")
                                .font(NotoSans.regular(size: 13))
                                .foregroundColor(.black)
                                
                        }
                        .padding(.horizontal, 13)
                        .padding(.vertical, 7)
                        .background(
                            Capsule()
                                .fill(.white)
                                .shadow(radius: 2)
                        )
                    }
                    Spacer()
                }
                .padding(.horizontal)
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                        Text("성동구 성수 2가")
                            .underline()
                            .font(NotoSans.regular(size: 15))
                    }
                    .onTapGesture {
                        
                    }
                }
            }
        }
        .bottomSheet(bottomSheetPosition: $bottomSheetPosition, options: [.noBottomPosition, .background(AnyView(Color.white))], headerContent: {
            FilterHeaderView(selectedFilter: selectedFilter, placeCount: places.count)
                .contentShape(Rectangle())
                .onTapGesture {
                    bottomSheetPosition = .top
                }
        }) {
            ListContentView(bottomSheetPosition: $bottomSheetPosition)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        .ignoresSafeArea(.keyboard)
        .fullScreenCover(isPresented: $isSearchViewPresented) {
            bottomSheetPosition = .bottom
        } content: {
            SearchPlaceView()
                .onAppear {
                    UIView.setAnimationsEnabled(true)
                }
        }
    }
}

struct PlaceMapView_Previews: PreviewProvider {
    
    static var previews: some View {
        let selectedFilter = SelectedFilters()
        selectedFilter.range = .km1
        selectedFilter.price = .around10000
        return NavigationView {
            PlaceMapView(selectedFilter: selectedFilter)
        }
    }
}
