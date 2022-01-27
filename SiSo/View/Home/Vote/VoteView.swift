//
//  VoteView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/03.
//

import SwiftUI


var width = UIScreen.main.bounds.width
struct VoteView: View {
    
    @State var selectedPlace: Place = placeDummy
    @State var isPlaceDetailViewPresented: Bool = false
    
    @State var direction: FourDirections? = nil
    @State var cardViewModel: [Place] = placesDummy
    
    @State var isShowResultViewActive: Bool = false
    
    @State var votedPlaceCount: Int = 0
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("투표 진행중이에요")
                    .font(NotoSans.bold(size: 27))
                HStack {
                    Text("선택완료")
                        .font(NotoSans.regular(size: 9))
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            Circle()
                                .foregroundColor(.gray)
                        )
                    Text("선택완료")
                        .font(NotoSans.regular(size: 9))
                        .padding()
                        .foregroundColor(.white)
                        .background(
                            Circle()
                                .foregroundColor(.gray)
                        )
                    Text("선택완료")
                        .font(NotoSans.regular(size: 9))
                        .padding()
                        .foregroundColor(.white)
                        .background(
                            Circle()
                                .foregroundColor(.gray)
                        )
                    Text("선택완료")
                        .font(NotoSans.regular(size: 9))
                        .padding()
                        .foregroundColor(.white)
                        .background(
                            Circle()
                                .foregroundColor(.gray)
                        )
                }
                Spacer()
                
                if votedPlaceCount != cardViewModel.count {
                    Text("다른 사람 기다리는중...")
                        .font(NotoSans.regular(size: 15))
                }
                CardStack(direction: FourDirections.direction, data: cardViewModel) { place, direction in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.direction = nil
                    }
                    votedPlaceCount += 1
                    if votedPlaceCount == cardViewModel.count {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            isShowResultViewActive.toggle()
                        }
                    }
                    doHapticFeedback()
                } content: { place, direction, isOnTop in
                    VoteCardView(place: place)
                        .frame(height: 400)
                        .padding([.top, .horizontal])
                        .onChange(of: direction, perform: { newValue in
                            self.direction = newValue
                        })
                        .onTapGesture {
                            if isOnTop {
                                self.selectedPlace = place
                                isPlaceDetailViewPresented.toggle()
                            }
                        }
                        .sheet(isPresented: $isPlaceDetailViewPresented) {
                            
                        } content: {
                            PlaceDetailView(place: selectedPlace)
                        }
                }
                .environment(\.cardStackConfiguration, CardStackConfiguration(
                    maxVisibleCards: 3,
                    swipeThreshold: 0.3
                ))
                Spacer()
            }
            
            VoteEmojiOverlayView(direction: $direction)
        }
        .background(
            NavigationLink(isActive: $isShowResultViewActive, destination: {
                VoteResultView()
            }, label: {
                EmptyView()
            })
        )

    }
    
    func doHapticFeedback() {
        let impactMed = UIImpactFeedbackGenerator(style: .medium)
        impactMed.impactOccurred()
    }
}

struct VoteView_Previews: PreviewProvider {
    static var previews: some View {
        VoteView()
    }
}
