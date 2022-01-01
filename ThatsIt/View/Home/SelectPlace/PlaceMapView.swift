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
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var query: String = ""
    @State var bottomSheetPosition: CustomBottomSheetPosition = .bottom
    
    @State var topBarHeight: CGFloat = .zero
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .scaleEffect(1.3)
                        .foregroundColor(.black)
                }
                
                HStack {
                    TextField("", text: $query)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .modifier(TextFieldClearButton(text: $query))
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.trailing, 8)
                }
                .background(
                    Color(.systemGray6)
                        .cornerRadius(8)
                )
            }
            .padding(.horizontal)
            .padding(.bottom, 2)
            
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
            .navigationBarHidden(true)
        }
    }
}

struct PlaceMapView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            PlaceMapView()
        }
    }
}
