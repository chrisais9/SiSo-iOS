//
//  MyFriend.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/27.
//

import Foundation
import SwiftUI

struct MyFriend: Codable {
    let profileImage: String = "https://www.ibossedu.co.kr/template/DESIGN_shared/program/theme/01/THUMBNAIL_60_60_icon_rep_box.gif"
    let name: String
    let email: String
}

class SelectedFriend: ObservableObject {
    
    let socketManager: SisoSocketManager = SisoSocketManager.shared
    
    @Published var exampleFriends: [MyFriend] = [
        MyFriend(name: "김갑돌", email: "chfasdf@naver.com"),
        MyFriend(name: "오형제", email: "chgregs9@naver.com"),
        MyFriend(name: "김철수", email: "chrisdfadf@naver.com"),
        MyFriend(name: "정우성", email: "chcggs4@naver.com"),
        MyFriend(name: "하정우", email: "cdasfs@naver.com"),
        MyFriend(name: "윤성호", email: "chriddd@naver.com"),
        MyFriend(name: "구형모", email: "chrisais9@naver.com")
    ]
    
    @Published var frieds: [MyFriend] = [MyFriend(name: "방장", email: "bangjang@naver.com")]
    
    var isEmpty: Bool {
        frieds.isEmpty
    }
    
    func removeFriendBy(email: String) {
        withAnimation {
            frieds.removeAll(where: {$0.email == email})
        }
    }
    
    func inviteFriend(name: String, email: String) {
        withAnimation {
            socketManager.sendFriendEntered(name: name, email: email)
            frieds.append(MyFriend(name: name, email: email))
            exampleFriends.removeAll(where: {$0.email == email})
        }
    }
    
    func syncFriendList() {
        withAnimation {
            socketManager.syncFriendList { friends in
                self.frieds = friends
            }
        }
    }
}
