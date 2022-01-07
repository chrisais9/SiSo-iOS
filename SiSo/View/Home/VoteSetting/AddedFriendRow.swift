//
//  AddedFriendRow.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/28.
//

import SwiftUI
import Kingfisher

struct AddedFriendRow: View {
    
    var isEditing: Bool
    var isHost: Bool
    var profileImage: String = "https://www.nicepng.com/png/full/73-730154_open-default-profile-picture-png.png"
    var name: String
    
    var body: some View {
        VStack(spacing: 0) {
            if isEditing {
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.gray)
                    }

                    Spacer()
                }
            }
            ZStack {
                URLImage(url: URL(string: profileImage)!)
                    .body
                    .resizable()
                    .clipShape(Circle())
                
                if isHost {
                    Image(systemName: "crown.fill")
                        .position(x: 30, y: 0)
                        .imageScale(.large)
                        .foregroundColor(.yellow)
                }
            }
            .frame(width: 60, height: 60)
            .padding(.bottom, 7)
            Text(name)
                .font(NotoSans.regular(size: 15))
        }
        .frame(width: 80)
        .padding()
        
    }
}

struct ConfirmMyFriendRow_Previews: PreviewProvider {
    static var previews: some View {
        AddedFriendRow(isEditing: true, isHost: true, name: "홍길동")
    }
}
