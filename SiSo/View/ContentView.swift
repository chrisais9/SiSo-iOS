//
//  ContentView.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/21.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        print("app started")
    }
    var body: some View {
        NavigationView {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("홈")
                    }
                VoteView()
                    .tabItem {
                        Image(systemName: "person.circle")
                        Text("마이페이지")
                    }
            }
        }
        .accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
