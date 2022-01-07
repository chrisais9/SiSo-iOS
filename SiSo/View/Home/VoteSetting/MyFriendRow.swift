//
//  MyFriendRow.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/27.
//

import SwiftUI
import Kingfisher

struct MyFriendRow: View {
    
    let selectedFriend: SelectedFriend
    
    let profileImage: String
    let name: String
    let email: String
    
    var body: some View {
        HStack {
            KFImage.url(URL(string: profileImage))
                .placeholder({
                    Rectangle().foregroundColor(.gray)
                })
                .resizable()
                .clipShape(Circle())
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                Text(name)
                    .font(NotoSans.regular(size: 14))
                Text(email)
                    .font(NotoSans.regular(size: 12))
            }
            Spacer()
            Button {
                withAnimation {
                    selectedFriend.inviteFriend(name: name, email: email)
                }
            } label: {
                Text("선택")
                    .font(NotoSans.medium(size: 15))
                    .padding()
                    .frame(width: 80, height: 30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke()
                            .foregroundColor(.black)
                    )
                    .foregroundColor(.black)
            }

        }
        .padding()
    }
}

struct MyFriendRow_Previews: PreviewProvider {
    static var previews: some View {
        MyFriendRow(selectedFriend: SelectedFriend(), profileImage: "https://www.ibossedu.co.kr/template/DESIGN_shared/program/theme/01/THUMBNAIL_60_60_icon_rep_box.gif", name: "홍길동", email: "chrisais9@naver.com")
    }
}
