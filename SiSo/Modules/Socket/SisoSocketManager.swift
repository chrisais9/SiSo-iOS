//
//  SisoSocketManager.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/07.
//

import Foundation
import SocketIO
import SwiftUI

class SisoSocketManager {
    
    private enum events: String {
        case friendEnter = "friend_enter"
        case friendList = "friend_list"
    }
    
    static let shared = SisoSocketManager()
    
    let manager = SocketManager(socketURL: URL(string: "http://192.168.0.30:3000")!, config: [.log(true) , .compress])
    var socket: SocketIOClient!
    
    private init() {
        socket = self.manager.socket(forNamespace: "/")
    }
    
    func openConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
    
    func sendFriendEntered(name: String, email: String) {
        socket.emit(events.friendEnter.rawValue, ["name": name, "email" : email])
    }
    
    func syncFriendList(completion: @escaping ([MyFriend]) -> Void) {
        socket.on(events.friendList.rawValue) { data, ack in
            do {
                print("0", data)
                let jsonData = try JSONSerialization.data(withJSONObject: data[0])
                let friends = try? JSONDecoder().decode([MyFriend].self, from: jsonData)
                print("2", friends)
                completion(friends ?? [])
            } catch {}
        }
    }
}
