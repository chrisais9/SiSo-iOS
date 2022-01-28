//
//  ListContentView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/01.
//

import SwiftUI

struct ListContentView: View {
    
    @Binding var bottomSheetPosition: CustomBottomSheetPosition
    
    @State var isVoteViewPresented: Bool = false
    
    var places: [Place] = placesDummy
    @State var selectedPlace: Place? = nil
    
    var colums: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: colums, spacing: 20) {
                    ForEach(places, id: \.name) { place in
                        PlaceCardView(place: place)
                            .frame(height: 250)
                            .onTapGesture {
                                selectedPlace = place
                            }
                            .background(
                                NavigationLink(tag: place, selection: $selectedPlace, destination: {
                                    PlaceDetailView(place: place)
                                }, label: {
                                    EmptyView()
                                })
                            )
                    }
                }
                .padding(.top)
                .padding(.horizontal)
            }
            VStack {
                Spacer()
                LargeButton(title: "투표 하러가기", backgroundColor: .appPrimary, foregroundColor: .white) {
                    isVoteViewPresented.toggle()
                }
                .padding(.horizontal)
                .background(
                    NavigationLink(isActive: $isVoteViewPresented, destination: {
                        VoteView()
                    }, label: {
                        EmptyView()
                    })
                )
            }
        }
        .opacity(bottomSheetPosition == .top ? 1 : 0)
    }
}

struct ListContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListContentView(bottomSheetPosition: .constant(.top))
    }
}
