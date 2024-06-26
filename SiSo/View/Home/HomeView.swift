//
//  HomeView.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/23.
//

import SwiftUI
import RealmSwift

struct HomeView: View {
    
    @ObservedRealmObject var user: User
    
    @State var isLobbyViewActive: Bool = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                VStack {
                    VStack(alignment: .leading, spacing: 17) {
                        Text("오늘 어디가지?")
                            .font(NotoSans.bold(size: 25))
                        
                        StyledText("\(user.name)님 안녕하세요.\n어려운 장소 선택 친구들과 한번에 해결하세요!")
                            .style(.highlight(color: .appPrimary), ranges: { [$0.range(of: user.name)!] })
                            .font(NotoSans.medium(size: 15))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 4)
                    .padding(.bottom, 20)
                    
                    Text("이미지 or 관련 일러스트")
                        .font(NotoSans.light(size: 17))
                        .frame(height: 200)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    
                    LargeButton(title: "장소 선택하러 가기", backgroundColor: .appPrimary, foregroundColor: .white) {
                        isLobbyViewActive.toggle()
                    }
                    .background(
                        NavigationLink(isActive: $isLobbyViewActive, destination: {
                            LobbyView()
                        }, label: {
                            EmptyView()
                        })
                    )
                }
                .padding()
                
                Text("지난 장소 투표")
                    .font(NotoSans.bold(size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Spacer()
                            .padding(.leading, 7)
                        ForEach(0..<10) { _ in
                            PreviousLocationRow()
                                .listRowInsets(EdgeInsets())
                        }
                    }
                    .padding(.horizontal, 2)
                    .padding(.vertical, 2)
                }
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let user: User = User()
        user.name = "구형모"
        return NavigationView {
            HomeView(user: .init(value: user))
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
