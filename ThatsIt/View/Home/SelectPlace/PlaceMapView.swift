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
    case hidden = 0
}

struct PlaceMapView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var query: String = ""
    @State var bottomSheetPosition: CustomBottomSheetPosition = .bottom
    
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
            NaverMapView()
                .frame(height: 620)
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
                        .padding(2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke()
                        )
                    Text("한식")
                        .padding(2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke()
                        )
                    Text("만원 이하")
                        .padding(2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke()
                        )
                    Text("상관 없음")
                        .padding(2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke()
                        )
                    Spacer()
                }
            }
            .padding(.bottom, 40)
            .contentShape(Rectangle())
            .onTapGesture {
                bottomSheetPosition = .top
            }
            .ignoresSafeArea(.keyboard)
            
        }) {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(0..<10) { i in
                            MyPlaceRow()
                        }
                    }
                }
                .padding(.horizontal)
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
