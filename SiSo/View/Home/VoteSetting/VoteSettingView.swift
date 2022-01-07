//
//  VoteSettingView.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/23.
//

import SwiftUI

struct VoteSettingView: View {
    
    @State var isSearchViewActive: Bool = false
    @State var query: String = ""
    
    @ObservedObject var selectedFriend: SelectedFriend = SelectedFriend()
    
    @State var isInstructionDialogActive: Bool = false
    @State var isPlaceMapViewPresented: Bool = false
    
    @State var location: String = ""
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    HStack {
                        Image(systemName: "timer")
                        Text("1:23")
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .strokeBorder()
                    )
                    
                    Text("우리 뭐 먹으러 갈까?")
                        .font(NotoSans.bold(size: 25))
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        Button {
                            isSearchViewActive.toggle()
                        } label: {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.black)
                                .background(Color.gray.opacity(0.3))
                                .cornerRadius(100)
                        }
                        .background(
                            NavigationLink(isActive: $isSearchViewActive, destination: {
                                SearchFriendView(selectedFriend: selectedFriend)
                            }, label: {
                                EmptyView()
                            })
                        )
                        Divider()
                            .frame(height: 100)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(selectedFriend.frieds, id: \.email) { friend in
                                    AddedFriendRow(isHost: friend.name == "방장", name: friend.name)
                                }
                            }
                        }
                    }
                    
                    LocationFilterView()
                }
                
            }
            .padding()
            VStack {
                Spacer()
                LargeButton(title: "자, 이제 시소타러 가볼까요?", disabled: selectedFriend.frieds.count <= 1, backgroundColor: .gray, foregroundColor: .white) {
                    if selectedFriend.isEmpty {
                        isInstructionDialogActive.toggle()
                    } else {
                        isPlaceMapViewPresented.toggle()
                    }
                }
                .background(
                    NavigationLink(isActive: $isPlaceMapViewPresented, destination: {
                        PlaceMapView()
                    }, label: {
                        EmptyView()
                    })
                )
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        //        .onAppear(perform: {
        //            selectedFriend.syncFriendList()
        //        })
        .simpleDialog(isShowing: $isInstructionDialogActive, dialogContent: {
            VStack {
                Text("친구 미선택")
                    .font(NotoSans.bold(size: 15))
                    .padding(.vertical, 17)
                
                Text("친구가 선택되지 않았어요!")
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
        .ignoresSafeArea(.keyboard)
    }
}

struct SelectFriendView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VoteSettingView()
        }
    }
}
