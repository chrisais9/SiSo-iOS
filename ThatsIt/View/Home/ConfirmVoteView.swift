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
            
            VStack(spacing: 21) {
                if let range = selectedFilters.range {
                    VStack {
                        Text("반경")
                            .font(NotoSans.bold(size: 15))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(range.rawValue)
                            .font(NotoSans.regular(size: 15))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                if let category = selectedFilters.category {
                    VStack {
                        Text("음식종류")
                            .font(NotoSans.bold(size: 15))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(category.rawValue)
                            .font(NotoSans.regular(size: 15))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                }
                if let price = selectedFilters.price {
                    VStack {
                        Text("가격대")
                            .font(NotoSans.bold(size: 15))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(price.rawValue)
                            .font(NotoSans.regular(size: 15))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                if let parking = selectedFilters.parking {
                    VStack {
                        Text("주차")
                            .font(NotoSans.bold(size: 15))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(parking.rawValue)
                            .font(NotoSans.regular(size: 15))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            Spacer()
            LargeButton(title: "지금 바로 투표 시작!", backgroundColor: .gray, foregroundColor: .white) {
                
            }
        }
        .padding()
    }
}

struct ConfirmVoteView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmVoteView(selectedFilters:  SelectedFilters(), selectedFriend: SelectedFriend())
    }
}
