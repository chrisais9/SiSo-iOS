//
//  SisoSocketManager.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/07.
//

import Foundation
import SocketIO

class SisoSocketManager {
    
    static let shared = SisoSocketManager()
    
    let manager = SocketManager(socketURL: URL(string: "http://localhost:3000")!, config: [.log(true) , .compress])
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
}
