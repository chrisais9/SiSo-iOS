//
//  InviteFriendView.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/26.
//

import SwiftUI

struct InviteFriendView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    init(selectedFriend: SelectedFriend) {
        self.selectedFriend = selectedFriend
        UITableView.appearance().backgroundColor = .clear
    }
    
    @State var query: String = ""
    @State var isShowingFriends: Bool = true
    
    @ObservedObject var selectedFriend: SelectedFriend
    
    var queriedFriends: [MyFriend] {
        selectedFriend.exampleFriends.filter({ $0.name.contains(query) || $0.email.contains(query) || query.isEmpty })
    }
    
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
            .padding()
            
            Spacer()
            
            if isShowingFriends {
                List {
                    ForEach(queriedFriends, id: \.email) { friend in
                        InviteFriendRow(
                            selectedFriend: selectedFriend,
                            profileImage: friend.profileImage,
                            name: friend.name,
                            email: friend.email
                        )
                        .listRowInsets(EdgeInsets())
                        .padding(.trailing)
                    }
                }
                .buttonStyle(BorderlessButtonStyle())
                .listStyle(.plain)
            } else {
                
                Text("친구가 가입 되어 있지 않아요!")
                    .font(NotoSans.regular(size: 15))
                LargeButton(title: "초대하기", foregroundColor: .black) {
                    isShowingFriends.toggle()
                }
                .frame(width: 150)
                Spacer()
            }
        }
        .ignoresSafeArea(.keyboard)
        .navigationBarHidden(true)
    }
}

struct SearchFriendView_Previews: PreviewProvider {
    static var previews: some View {
        InviteFriendView(selectedFriend: SelectedFriend())
    }
}
