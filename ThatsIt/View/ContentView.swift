//
//  ContentView.swift
//  ThatsIt
//
//  Created by 구형모 on 2021/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("홈")
                }
            Text("2")
                .tabItem {
                    Image(systemName: "mappin")
                    Text("나의 장소")
                }
            Text("3")
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("마이페이지")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
