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
        ZStack {
            VStack {
                VStack {
                    Image(systemName: "crown.fill")
                        .foregroundColor(.yellow)
                }.opacity(isHost ? 1 : 0)
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }.opacity(isEditing ? 1 : 0)
                Spacer()
            }
            VStack {
                URLImage(url: URL(string: profileImage)!)
                    .body
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                
                
                Text(name)
                    .font(NotoSans.regular(size: 15))
            }
            .padding()
            
            
        }
        .if(isEditing) { view in
            view.wiggling()
        }
    }
}

struct ConfirmMyFriendRow_Previews: PreviewProvider {
    static var previews: some View {
        AddedFriendRow(isEditing: true, isHost: true, name: "홍길동")
            .frame(height: 200)
    }
}
