//
//  HomeView.swift
//  ThatsIt
//
//  Created by 구형모 on 2021/12/23.
//

import SwiftUI

struct HomeView: View {
    @State var isLoginPageActive: Bool = false
    @State var isInstructionDialogActive: Bool = false
    @State var isSelectFriendViewActive: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
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
                
                VStack(alignment: .leading, spacing: 17) {
                    Text("오늘 어디가지?")
                        .font(.title)
                        .bold()
                    Text("(닉네임)님 안녕하세요. \n 어려운 장소 선택 친구들과 한번에 해결하세요!")
                        .fixedSize(horizontal: false, vertical: true)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
                
                Text("이미지 or 관련 일러스트")
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 200)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.black, lineWidth: 1)
                    )
                
                LargeButton(title: "장소 선택하러 가기", backgroundColor: Color.black.opacity(0.7), foregroundColor: .white) {
                    isSelectFriendViewActive.toggle()
                }
                .background(
                    NavigationLink(isActive: $isSelectFriendViewActive, destination: {
                        SelectFriendView()
                    }, label: {
                        EmptyView()
                    })
                )
                
                Text("지난 장소 투표")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        PreviousLocationRow()
                            .listRowInsets(EdgeInsets())
                        PreviousLocationRow()
                            .listRowInsets(EdgeInsets())
                        PreviousLocationRow()
                            .listRowInsets(EdgeInsets())
                        PreviousLocationRow()
                            .listRowInsets(EdgeInsets())
                    }
                    .padding(.horizontal, 2)
                    .padding(.vertical)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
            .padding()
            .fullScreenCover(isPresented: $isLoginPageActive, onDismiss: {
                
            }, content: {
                LoginView()
            })
            .simpleDialog(isShowing: $isInstructionDialogActive, dialogContent: {
                VStack {
                    Text("그래, 그거 설명서")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.vertical, 17)
                    
                    Text("1. 장소 선택하러 가기 클릭\n2. 투표를 함께할 친구 초대\n3. 필터 선택\n4. 내 동네 맛집 리스트 확인\n5. 친구들과 투표시작\n6. 1위 결과 발표!")
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 13)
                        .font(.caption)
                    
                    Divider()
                    Button {
                        isInstructionDialogActive.toggle()
                    } label: {
                        Text("확인")
                            .foregroundColor(.black)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding(.bottom)
                    }
                }
            })
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
