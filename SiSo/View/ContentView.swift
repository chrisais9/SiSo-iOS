//
//  ContentView.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/21.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @ObservedResults(User.self) var users
    
    init() {
        if users.isEmpty {
            let realm = try! Realm()
            try! realm.write {
                realm.add(User())
            }
        }
    }
    
    var body: some View {
        NavigationView {
            TabView {
                HomeView()
                    .navigationBarHidden(true)
                    .tabItem {
                        Image(systemName: "house")
                        Text("홈")
                    }
                
                if !users.isEmpty{
                    MyPageView(user: users.first!)
                        .navigationBarHidden(true)
                        .tabItem {
                            Image(systemName: "person.circle")
                            Text("마이페이지")
                        }
                }
            }
        }
        .onChange(of: users, perform: { newValue in
            if users.isEmpty {
                let realm = try! Realm()
                try! realm.write {
                    realm.add(User())
                }
            }
        })
        .accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
