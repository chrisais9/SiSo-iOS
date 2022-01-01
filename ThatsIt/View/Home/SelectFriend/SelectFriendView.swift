//
//  SelectFriendView.swift
//  ThatsIt
//
//  Created by 구형모 on 2021/12/23.
//

import SwiftUI

struct SelectFriendView: View {
    
    @State var isFilterViewActive: Bool = false
    @State var isSearchViewActive: Bool = false
    @State var query: String = ""
    
    @ObservedObject var selectedFilters: SelectedFilters = SelectedFilters()
    @ObservedObject var selectedFriend: SelectedFriend = SelectedFriend()
    
    @State var isInstructionDialogActive: Bool = false
    @State var isConfirmationVoteViewActive: Bool = false
    
    var body: some View {
        VStack {
            Text("투표를 함께 할\n친구를 선택해주세요.")
                .font(NotoSans.bold(size: 25))
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Text("이메일, 닉네임으로 검색해보세요.")
                    .font(NotoSans.regular(size: 15))
                Spacer()
                Image(systemName: "magnifyingglass")
            }
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.black, lineWidth: 1)
            )
            .onTapGesture {
                isSearchViewActive.toggle()
            }
            .background(
                NavigationLink(isActive: $isSearchViewActive, destination: {
                    SearchFriendView(selectedFriend: selectedFriend)
                }, label: {
                    EmptyView()
                })
            )
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(selectedFriend.frieds, id: \.email) { friend in
                        HStack {
                            Text(friend.name)
                            Spacer()
                                .frame(width: 23)
                            Image(systemName: "multiply.circle.fill")
                                .onTapGesture {
                                    selectedFriend.removeFriendBy(email: friend.email)
                                }
                        }
                        .padding(5)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .foregroundColor(.gray.opacity(0.5))
                        )
                    }
                }
            }
            
            LargeButton(title: "필터 선택하기", foregroundColor: .black) {
                isFilterViewActive.toggle()
            }
            .background(
                NavigationLink(isActive: $isFilterViewActive, destination: {
                    SelectFilterView(selectedFilters: selectedFilters)
                }, label: {
                    EmptyView()
                })
            )
            .padding(.vertical)
            
            ScrollView(showsIndicators: false, content: {
                
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
            })
            
            Spacer()
            HStack {
                Text("가입되지 않은 친구라면?")
                    .font(NotoSans.regular(size: 15))
                Spacer()
                Button {
                    
                } label: {
                    Text("초대하기")
                        .font(NotoSans.regular(size: 15))
                        .padding(.vertical, 5)
                        .padding(.horizontal, 25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke()
                        )
                        .foregroundColor(.black)
                }
            }
            LargeButton(title: "다음으로", backgroundColor: .gray, foregroundColor: .white) {
                if selectedFriend.isEmpty || selectedFilters.isEmpty {
                    isInstructionDialogActive.toggle()
                } else {
                    isConfirmationVoteViewActive.toggle()
                }
            }
            .background(
                NavigationLink(isActive: $isConfirmationVoteViewActive, destination: {
                    ConfirmVoteView(selectedFilters: selectedFilters, selectedFriend: selectedFriend)
                }, label: {
                    EmptyView()
                })
            )
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "text.bubble.fill")
            }
        }
        .ignoresSafeArea(.keyboard)
        .simpleDialog(isShowing: $isInstructionDialogActive, dialogContent: {
            VStack {
                Text(selectedFriend.isEmpty ? "친구 미선택" : "필터 미선택")
                    .font(NotoSans.bold(size: 15))
                    .padding(.vertical, 17)
                
                Text("\(selectedFriend.isEmpty ? "친구" : "필터")가 선택되지 않았어요!")
                    .font(NotoSans.regular(size: 15))
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
}

struct SelectFriendView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SelectFriendView()
        }
    }
}
