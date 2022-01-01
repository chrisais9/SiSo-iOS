//
//  PlaceMapView.swift
//  ThatsIt
//
//  Created by 구형모 on 2021/12/30.
//

import SwiftUI
import BottomSheetSwiftUI

enum CustomBottomSheetPosition: CGFloat, CaseIterable {
    case top = 0.9
    case bottom = 0.15
}

struct PlaceMapView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var query: String = ""
    @State var bottomSheetPosition: CustomBottomSheetPosition = .bottom
    
    @State var topBarHeight: CGFloat = .zero
    
    var body: some View {
        GeometryReader { proxy in
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
                .background(GeometryReader { topBarProxy -> Color in
                    DispatchQueue.main.async {
                        topBarHeight = topBarProxy.size.height
                    }
                    return Color.clear
                })
                NaverMapView()
                    .frame(height: proxy.size.height * 0.85 - topBarHeight)
                Spacer()
            }
            .navigationBarHidden(true)
            .bottomSheet(bottomSheetPosition: $bottomSheetPosition, options: [.noBottomPosition], headerContent: {
                VStack {
                    HStack {
                        Text("성동구 성수 2가")
                            .font(NotoSans.bold(size: 19))
                        Spacer()
                        Text("총 10개")
                            .font(NotoSans.regular(size: 19))
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Text("1km")
                            .font(NotoSans.regular(size: 15))
                            .padding(2)
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke()
                            )
                        Text("한식")
                            .font(NotoSans.regular(size: 15))
                            .padding(2)
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke()
                            )
                        Text("만원 이하")
                            .font(NotoSans.regular(size: 15))
                            .padding(2)
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke()
                            )
                        Text("상관 없음")
                            .font(NotoSans.regular(size: 15))
                            .padding(2)
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke()
                            )
                        Spacer()
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    bottomSheetPosition = .top
                }
            }) {
                PlaceListView()
            }
            .ignoresSafeArea(.keyboard)
        }
    }
}

struct PlaceMapView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceMapView()
    }
}
