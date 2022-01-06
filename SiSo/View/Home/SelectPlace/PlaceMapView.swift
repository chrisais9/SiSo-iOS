//
//  PlaceMapView.swift
//  ThatsIt
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
    
    @State var bottomSheetPosition: CustomBottomSheetPosition = .bottom
    
    @State var topBarHeight: CGFloat = .zero
    
    @State var isSearchViewPresented: Bool = false
    
    var body: some View {
        VStack {
            GeometryReader { proxy in
                VStack {
                    NaverMapView()
                        .frame(height: proxy.size.height * (1 - CustomBottomSheetPosition.bottom.rawValue))
                    Spacer()
                    
                }
                .bottomSheet(bottomSheetPosition: $bottomSheetPosition, options: [.noBottomPosition], headerContent: {
                    FilterHeaderView()
                        .contentShape(Rectangle())
                        .onTapGesture {
                            bottomSheetPosition = .top
                        }
                }) {
                    ListContentView(bottomSheetPosition: $bottomSheetPosition)
                }
            }
        }
        .ignoresSafeArea(.keyboard)
        .navigationBarTitleDisplayMode(.inline)
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
                    UIView.setAnimationsEnabled(false)
                    isSearchViewPresented.toggle()
                }
            }
        }
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
        NavigationView {
            PlaceMapView()
        }
    }
}
