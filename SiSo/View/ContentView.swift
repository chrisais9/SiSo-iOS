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
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("홈")
                    }
                    .tag(SelectedTab.home)
                
                if !users.isEmpty{
                    MyPageView(user: users.first!)
                        .tabItem {
                            Image(systemName: "person.circle")
                            Text("마이페이지")
                        }
                        .tag(SelectedTab.mypage)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    if selectedTab == SelectedTab.home {
                        Button {
                            isInstructionDialogActive.toggle()
                        } label: {
                            Image(systemName: "info.circle")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 20, height: 20)
                        }
                        Button {
                            isLoginPageActive.toggle()
                        } label: {
                            Image(systemName: "bell")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 20, height: 20)
                        }
                    }
                }
            }
            .simpleDialog(isShowing: $isInstructionDialogActive, dialogContent: {
                VStack {
                    Text("그래, 그거 설명서")
                        .font(NotoSans.bold(size: 18))
                        .padding(.vertical, 17)
                    
                    Text("1. 장소 선택하러 가기 클릭\n2. 투표를 함께할 친구 초대\n3. 필터 선택\n4. 내 동네 맛집 리스트 확인\n5. 친구들과 투표시작\n6. 1위 결과 발표!")
                        .font(NotoSans.regular(size: 13))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 13)
                    
                    Divider()
                    Button {
                        isInstructionDialogActive.toggle()
                    } label: {
                        Text("확인")
                            .font(NotoSans.medium(size: 16))
                            .foregroundColor(.black)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding(.bottom)
                    }
                }
            })
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
