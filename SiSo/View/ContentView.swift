//
//  ContentView.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/21.
//

import SwiftUI
import RealmSwift

enum SelectedTab: Hashable {
    case home
    case mypage
}
struct ContentView: View {
    
    @ObservedResults(User.self) var users
    
    @State var selectedTab: SelectedTab = SelectedTab.home
    
    @State var isInstructionDialogActive: Bool = false
    @State var isLoginPageActive: Bool = false
    
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
            TabView(selection: $selectedTab) {
                if !users.isEmpty{
                    HomeView(user: users.first!)
                        .tabItem {
                            Image(systemName: "house")
                            Text("홈")
                        }
                        .tag(SelectedTab.home)
                    
                    
                    MyPageView(user: users.first!)
                        .tabItem {
                            Image(systemName: "person.circle")
                            Text("마이페이지")
                        }
                        .tag(SelectedTab.mypage)
                }
            }
            .accentColor(.appPrimary)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack(alignment: .firstTextBaseline, spacing: 3) {
                        Text("시소")
                            .foregroundColor(.appPrimary)
                            .font(NotoSans.black(size: 20))
                        Text("시간을 소중하게 ™")
                            .foregroundColor(.appPrimary)
                            .font(NotoSans.regular(size: 9))
                    }
                }
            }
        }
        .accentColor(.black)
        .onChange(of: users, perform: { newValue in
            if users.isEmpty {
                let realm = try! Realm()
                try! realm.write {
                    realm.add(User())
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
