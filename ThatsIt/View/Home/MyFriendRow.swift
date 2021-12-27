//
//  MyFriendRow.swift
//  ThatsIt
//
//  Created by 구형모 on 2021/12/27.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyFriendRow: View {
    
    let profileImage: String
    let name: String
    let email: String
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: profileImage))
                .resizable()
                .placeholder {
                    Rectangle().foregroundColor(.gray)
                }
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
                
            } label: {
                Text("선택")
                    .font(NotoSans.medium(size: 15))
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke()
                            .foregroundColor(.black)
                            .frame(width: 80, height: 30)
                    )
                    .foregroundColor(.black)
            }

        }
        .padding()
    }
}

struct MyFriendRow_Previews: PreviewProvider {
    static var previews: some View {
        MyFriendRow(profileImage: "https://www.ibossedu.co.kr/template/DESIGN_shared/program/theme/01/THUMBNAIL_60_60_icon_rep_box.gif", name: "홍길동", email: "chrisais9@naver.com")
    }
}
