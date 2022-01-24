//
//  DeckListView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/10.
//

import SwiftUI

struct DeckListView: View {
    
    @State var isDetailViewActive: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("전체")
                        .bold()
                    Divider()
                }
                VStack {
                    Text("양식")
                    Divider()
                }
                VStack {
                    Text("중식")
                    Divider()
                }
                VStack {
                    Text("한식")
                    Divider()
                }
            }
            ScrollView {
                LazyVStack {
                    NavigationLink(isActive: $isDetailViewActive) {
                        DeckDetailView()
                    } label: {
                        DeckCardView(image: "http://img4.tmon.kr/cdn3/deals/2021/07/15/4500036162/original_4500036162_front_f8dfd_1626343427production.jpg",  title: "오늘은 매운게 땡길땐🔥", likes: "1,201", distance: "0.3")
                            .padding(.bottom)
                    }
                    
                    NavigationLink(isActive: $isDetailViewActive) {
                        DeckDetailView()
                    } label: {
                        DeckCardView(image: "https://www.gyeongju.go.kr/upload/content/thumb/20191211/A5E16B2009A741B3B54A228BFA0518D9.jpg", title: "김부장이 추천하는 베트남 맛집", likes: "1,201", distance: "0.8")
                            .padding(.bottom)
                    }
                    
                    NavigationLink(isActive: $isDetailViewActive) {
                        DeckDetailView()
                    } label: {
                        DeckCardView(image: "https://src.hidoc.co.kr/image/lib/2020/6/17/1592363657269_0.jpg", title: "오늘은 피자다!", likes: "1,201", distance: "1.2")
                            .padding(.bottom)
                    }
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                }

            }
        }
    }
}

struct DeckListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DeckListView()
        }
    }
}
