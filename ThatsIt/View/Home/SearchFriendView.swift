//
//  SearchFriendView.swift
//  ThatsIt
//
//  Created by 구형모 on 2021/12/26.
//

import SwiftUI

struct SearchFriendView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    init(selectedFriend: SelectedFriend) {
        self.selectedFriend = selectedFriend
        UITableView.appearance().backgroundColor = .clear
    }
    
    @State var query: String = ""
    @State var isShowingFriends: Bool = false
    
    var selectedFriend: SelectedFriend
    
    @State var myFriends: [MyFriend] = [
        MyFriend(name: "김갑돌", email: "chfasdf@naver.com"),
        MyFriend(name: "오형제", email: "chgregs9@naver.com"),
        MyFriend(name: "김철수", email: "chrisdfadf@naver.com"),
        MyFriend(name: "정우성", email: "chcggs4@naver.com"),
        MyFriend(name: "하정우", email: "cdasfs@naver.com"),
        MyFriend(name: "윤성호", email: "chriddd@naver.com"),
        MyFriend(name: "구형모", email: "chrisais9@naver.com")
    ]
    
    var queriedFriends: [MyFriend] {
        if query.isEmpty {
            return myFriends
        }
        else {
            return myFriends.filter({ $0.name.starts(with: query) || $0.email.starts(with: query) })
        }
    }
    
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
            
            if isShowingFriends {
                List {
                    ForEach(queriedFriends, id: \.email) { friend in
                        MyFriendRow(
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
        SearchFriendView(selectedFriend: SelectedFriend())
    }
}
