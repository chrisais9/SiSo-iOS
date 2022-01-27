//
//  SearchPlaceView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/02.
//

import SwiftUI

struct SearchPlaceView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var isFirstResponder: Bool = true
    
    @State var query: String = ""
    
    var body: some View {
        VStack(spacing: 15) {
            ZStack {
                HStack {
                    Button {
                        isFirstResponder = false
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .scaleEffect(1.3)
                            .foregroundColor(.black)
                    }
                    Spacer()
                }
                Text("지역 검색")
                    .font(NotoSans.medium(size: 16))
            }
            .padding(.horizontal)
            Divider()
            HStack {
                Image(systemName: "magnifyingglass")
                    .font(NotoSans.regular(size: 17))
                
                AutoFocusTextField("지역을 검색하세요.", text: $query, isFirstResponder: $isFirstResponder) {
                    $0.clearButtonMode = .whileEditing
                }
                .font(NotoSans.regular(size: 17))
                .frame(height: 27)
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
            .overlay(
                Capsule()
                    .strokeBorder(.black.opacity(0.1))
            )
            .padding(.horizontal)
            
            Spacer()
            Text("지역을 검색하고,\n맛집들을 찾아보세요!")
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .font(NotoSans.regular(size: 15))
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct SearchPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchPlaceView()
        }
    }
}
