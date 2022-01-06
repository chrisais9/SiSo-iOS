//
//  SearchPlaceView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/02.
//

import SwiftUI

struct SearchPlaceView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var query: String = ""
    
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
                    AutoFocusTextField(text: $query, isFirstResponder: .constant(true)) {
                        $0.clearButtonMode = .whileEditing
                    }
                    .frame(height: 27)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 10)
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
            
            Spacer()
        }
    }
}

struct SearchPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPlaceView()
    }
}
