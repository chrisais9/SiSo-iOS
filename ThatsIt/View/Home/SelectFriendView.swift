//
//  SelectFriendView.swift
//  ThatsIt
//
//  Created by 구형모 on 2021/12/23.
//

import SwiftUI

struct SelectFriendView: View {
    
    @State var isFilterViewActive: Bool = false
    @State var query: String = ""
    
    @ObservedObject var selectedFilters: SelectedFilters = SelectedFilters()
    
    var body: some View {
        VStack {
            Text("투표를 함께 할\n친구를 선택해주세요.")
                .bold()
                .font(.title)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
                .frame(height: 60)
            
            HStack {
                TextField("이메일, 닉네임으로 검색해보세요.", text: $query)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                Image(systemName: "magnifyingglass")
            }
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.black, lineWidth: 1)
            )
            
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
            
            Spacer()
            HStack {
                Text("가입되지 않은 친구라면?")
                Spacer()
                Button {
                    
                } label: {
                    Text("초대하기")
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
                
            }
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "text.bubble.fill")
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct SelectFriendView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SelectFriendView()
        }
    }
}
