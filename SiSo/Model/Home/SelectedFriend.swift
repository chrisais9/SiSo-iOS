//
//  MyFriend.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/27.
//

import Foundation
import SwiftUI

struct MyFriend: Codable {
    let profileImage: String
    let name: String
    let email: String
}

class SelectedFriend: ObservableObject {
    
    let socketManager: SisoSocketManager = SisoSocketManager.shared
    
    @Published var exampleFriends: [MyFriend] = [
        MyFriend(profileImage: "https://randomwordgenerator.com/img/picture-generator/57e8d0404f5bae14f1dc8460962e33791c3ad6e04e5074417d2e72dc914cc3_640.jpg", name: "김갑돌", email: "chfasdf@naver.com"),
        MyFriend(profileImage: "https://randompicturegenerator.com/img/people-generator/gb3bf3839f847482be66a54bf01c2453ad8ade402b733cc1dbb345ea5ccd663130e4645c49b31f2e03876b4ee706732c8_640.jpg", name: "오형제", email: "chgregs9@naver.com"),
        MyFriend(profileImage: "https://randompicturegenerator.com/img/people-generator/g3bc6e64ae0fa46cfa3f31cfc36385952355be330d4ff6733c879ce55426419cc9c8f1da59ef4784b78ff73f5d1a1cecf_640.jpg", name: "김철수", email: "chrisdfadf@naver.com"),
        MyFriend(profileImage: "https://randompicturegenerator.com/img/people-generator/g104596d4af5f290ae8d4202e8183a0b2d9def780bf50a925c11d6bd89ff7f4cd93b5ded814bae63bd0a708bc02406a21_640.jpg", name: "정우성", email: "chcggs4@naver.com"),
        MyFriend(profileImage: "https://randompicturegenerator.com/img/people-generator/g5b697ab469f8775e5f7b506c021049dc9642d3e99bbc3cc7642b1d3c2382287f24cbcc37a4f00e521933c07c09e73216_640.jpg", name: "하정우", email: "cdasfs@naver.com"),
        MyFriend(profileImage: "https://randompicturegenerator.com/img/people-generator/gbc4552953e8b863f0e84b8885f5de840e4db37c57c8802d19d6a72019ceba0b42878e1c87eeb3c00edb542fc7e223ce8_640.jpg", name: "윤성호", email: "chriddd@naver.com"),
        MyFriend(profileImage: "https://randompicturegenerator.com/img/people-generator/g2f49885fd940d1ae3f9e51caf7196b46a86de73e2f011eb622ec0b4fdca3e3ff91289cacce845d8e564d5658f6bd7b2d_640.jpg", name: "구형모", email: "chrisais9@naver.com")
    ]
    
    @Published var frieds: [MyFriend] = [MyFriend(profileImage: "https://randompicturegenerator.com/img/people-generator/g2ea14b498a4e6657e645d0cb555046f427bd3d175a833bf04aaf7c615f03a74a3a70e99a2678bff8aa7505d1ad5763da_640.jpg", name: "방장", email: "bangjang@naver.com")]
    
    var isEmpty: Bool {
        frieds.count <= 1
    }
    
    func removeFriendBy(email: String) {
        withAnimation {
            frieds.removeAll(where: {$0.email == email})
        }
    }
//
//    func inviteFriend(name: String, email: String) {
//        withAnimation {
//            socketManager.sendFriendEntered(name: name, email: email)
//            frieds.append(MyFriend(name: name, email: email))
//            exampleFriends.removeAll(where: {$0.email == email})
//        }
//    }
    
    func syncFriendList() {
        withAnimation {
            socketManager.syncFriendList { friends in
                self.frieds = friends
            }
        }
    }
}
