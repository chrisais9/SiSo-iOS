//
//  HomeView.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var isSelectFriendViewActive: Bool = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
        VStack {
            VStack {
                VStack(alignment: .leading, spacing: 17) {
                    Text("오늘 어디가지?")
                        .font(NotoSans.bold(size: 30))
                    Text("(닉네임)님 안녕하세요. \n 어려운 장소 선택 친구들과 한번에 해결하세요!")
                        .font(NotoSans.medium(size: 15))
                        .fixedSize(horizontal: false, vertical: true)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
                
                Text("이미지 or 관련 일러스트")
                    .font(NotoSans.light(size: 17))
                    .frame(height: 200)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.black, lineWidth: 1)
                    )
                
                LargeButton(title: "장소 선택하러 가기", backgroundColor: Color.black.opacity(0.7), foregroundColor: .white) {
                    isSelectFriendViewActive.toggle()
                }
                .background(
                    NavigationLink(isActive: $isSelectFriendViewActive, destination: {
                        VoteView()
                    }, label: {
                        EmptyView()
                    })
                )
                
                Text("지난 장소 투표")
                    .font(NotoSans.bold(size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            
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
        NavigationView {
            HomeView()
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
