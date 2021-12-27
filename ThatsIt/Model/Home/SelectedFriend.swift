//
//  MyFriend.swift
//  ThatsIt
//
//  Created by 구형모 on 2021/12/27.
//

import Foundation

class SelectedFriend: ObservableObject {
    @Published var frieds: [MyFriend] = []
    
    var isEmpty: Bool {
        frieds.isEmpty
    }
    func removeFriendBy(email: String) {
        frieds.removeAll(where: {$0.email == email})
    }
}

struct MyFriend {
    let profileImage: String = "https://www.ibossedu.co.kr/template/DESIGN_shared/program/theme/01/THUMBNAIL_60_60_icon_rep_box.gif"
    let name: String
    let email: String
}
