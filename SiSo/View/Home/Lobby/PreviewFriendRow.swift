//
//  PreviewFriendRow.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/28.
//

import SwiftUI
import Kingfisher

struct PreviewFriendRow: View {
    
    var isEditing: Bool = false
    let isHost: Bool
    let profileImage: String
    let name: String
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Image(systemName: "crown.fill")
                        .foregroundColor(.yellow)
                }.opacity(isHost ? 1 : 0)
                Spacer()
            }
            VStack {
                KFImage(URL(string: profileImage))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                
                Text(name)
                    .font(NotoSans.regular(size: 15))
            }
        }
    }
}

struct ConfirmMyFriendRow_Previews: PreviewProvider {
    static var previews: some View {
        PreviewFriendRow(isEditing: true, isHost: true, profileImage: "", name: "홍길동")
            .frame(height: 200)
    }
}
