//
//  SearchFriendView.swift
//  ThatsIt
//
//  Created by 구형모 on 2021/12/26.
//

import SwiftUI

struct SearchFriendView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var query: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
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
            .padding()
            Spacer()
            Text("친구가 가입 되어 있지 않아요!")
                .font(NotoSans.regular(size: 15))
            LargeButton(title: "초대하기", foregroundColor: .black) {
                
            }
            .frame(width: 150)
            Spacer()
        }
        .ignoresSafeArea(.keyboard)
        .navigationBarHidden(true)
    }
}

struct SearchFriendView_Previews: PreviewProvider {
    static var previews: some View {
        SearchFriendView()
    }
}
