//
//  AddedFriendRow.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/28.
//

import SwiftUI
import SDWebImageSwiftUI

struct AddedFriendRow: View {
    
    var isHost: Bool = false
    var profileImage: String = "https://www.ibossedu.co.kr/template/DESIGN_shared/program/theme/01/THUMBNAIL_60_60_icon_rep_box.gif"
    var name: String = "닉네임"
    
    var body: some View {
        VStack(spacing: 15) {
            ZStack {
                WebImage(url: URL(string: profileImage))
                    .resizable()
                    .placeholder {
                        Rectangle().foregroundColor(.gray)
                    }
                    .clipShape(Circle())
                Image(systemName: "crown.fill")
                    .position(x: 30, y: 0)
                    .imageScale(.large)
                    .foregroundColor(.yellow)
            }
            .frame(width: 60, height: 60)
            Text(name)
                .font(NotoSans.regular(size: 15))
        }
        .padding()
        
    }
}

struct ConfirmMyFriendRow_Previews: PreviewProvider {
    static var previews: some View {
        AddedFriendRow()
    }
}
