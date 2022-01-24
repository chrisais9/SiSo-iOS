//
//  DeckDetailView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/24.
//

import SwiftUI
import Kingfisher

struct DeckDetailView: View {
    
    var place: Place = placeDummy
    var places: [Place] = placesDummy
    
    @State var isVoteViewActive: Bool = false
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                GeometryReader { geometry in
                    ZStack {
                        if geometry.frame(in: .global).minY <= 0 {
                            KFImage.url(URL(string: place.image))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .offset(y: geometry.frame(in: .global).minY/9)
                                .clipped()
                        } else {
                            KFImage.url(URL(string: place.image))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
                                .clipped()
                                .offset(y: -geometry.frame(in: .global).minY)
                        }
                    }
                }
                .frame(height: 300)
                VStack {
                    Text("김부장이 추천하는 고오급 맛집🥸")
                        .font(NotoSans.bold(size: 23))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    HStack {
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(.orange)
                        Text("1,201")
                            .font(NotoSans.regular(size: 17))
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Divider()
                        .opacity(0.3)
                    
                    Text("덱에 들어있는 맛집들")
                        .font(NotoSans.bold(size: 19))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    Group {
                        ForEach(places, id: \.self.name) { place in
                            PlaceMenuRow(image: place.image, name: place.name, description: place.description)
                            
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .ignoresSafeArea(.container, edges: .top)
            VStack {
                LargeButton(title: "이 덱으로 투표 시작", backgroundColor: Color(hex: "#EF9D25"), foregroundColor: .white) {
                    isVoteViewActive.toggle()
                }
                .background(
                    NavigationLink(isActive: $isVoteViewActive, destination: {
                        VoteView()
                    }, label: {
                        EmptyView()
                    })
                )
            }
            .padding(.horizontal)
        }
    }
}

struct DeckDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DeckDetailView()
        }
    }
}
