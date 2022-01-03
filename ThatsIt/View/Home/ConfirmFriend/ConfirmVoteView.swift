//
//  ConfirmVoteView.swift
//  ThatsIt
//
//  Created by 구형모 on 2021/12/28.
//

import SwiftUI

struct ConfirmVoteView: View {
    
    @ObservedObject var selectedFilters: SelectedFilters
    @ObservedObject var selectedFriend: SelectedFriend
    
    @State var isPlaceMapViewActive: Bool = false
    
    var body: some View {
        VStack {
            Text("모두 모였으면,\n지금 바로 투표를 시작해보세요!")
                .font(NotoSans.bold(size: 25))
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
                .frame(height: 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(selectedFriend.frieds, id: \.email) { friend in
                        ConfirmMyFriendRow(profileImage: friend.profileImage, name: friend.name)
                    }
                }
            }
            Spacer()
                .frame(height: 30)
            FilterResultView(selectedFilters: selectedFilters)
            Spacer()
            LargeButton(title: "지금 바로 투표 시작!", backgroundColor: .gray, foregroundColor: .white) {
                isPlaceMapViewActive.toggle()
            }
            .background(
                NavigationLink(isActive: $isPlaceMapViewActive, destination: {
                    PlaceMapView()
                }, label: {
                    EmptyView()
                })
            )
        }
        .padding()
    }
}

struct ConfirmVoteView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmVoteView(selectedFilters:  SelectedFilters(), selectedFriend: SelectedFriend())
    }
}
