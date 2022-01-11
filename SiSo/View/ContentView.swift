//
//  ContentView.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("홈")
                    }
                MyPageView()
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
