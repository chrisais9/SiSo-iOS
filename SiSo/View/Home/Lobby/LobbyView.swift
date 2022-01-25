//
//  LobbyView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/25.
//

import SwiftUI

struct LobbyView: View {
    
    @ObservedObject var selectedFriend: SelectedFriend = SelectedFriend()
    @ObservedObject var selectedFilter: SelectedFilters = SelectedFilters()
    
    @State var isSelectFilterViewActive: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("방번호 : 7136")
                .font(NotoSans.regular(size: 20))
                .onTapGesture {
                    selectedFriend.frieds.append(contentsOf: selectedFriend.exampleFriends)
                }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(selectedFriend.frieds, id: \.email) { friend in
                        PreviewFriendRow(isHost: friend.name == "방장", profileImage: friend.profileImage, name: friend.name)
                    }
                    if selectedFriend.frieds.count == 1 {
                        Text("초대를 위해 방 번호를 친구에게 알려주세요")
                            .font(NotoSans.regular(size: 13))
                            .foregroundColor(.gray)
                    }
                }
            }.frame(height: 100)
            
            Spacer()
            
            SisoWhiteButton(title: "필터 선택하기") {
                isSelectFilterViewActive.toggle()
            }
            .background(
                NavigationLink(isActive: $isSelectFilterViewActive, destination: {
                    SelectFilterView(selectedFilters: selectedFilter)
                }, label: {
                    EmptyView()
                })
            )
            FilterPreviewView(selectedFilter: selectedFilter)
            Spacer()
            
            LargeButton(title: "다음으로", disabled: selectedFilter.isEmpty || selectedFriend.isEmpty , backgroundColor: .appPrimary, foregroundColor: .white) {
                
            }
        }
        .padding(.horizontal)
    }
}

struct LobbyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LobbyView()
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
