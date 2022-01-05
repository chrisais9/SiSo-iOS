//
//  VoteView.swift
//  ThatsIt
//
//  Created by 구형모 on 2022/01/03.
//

import SwiftUI
import SDWebImageSwiftUI


var width = UIScreen.main.bounds.width
struct VoteView: View {
    
    @State var selectedPlace: Place? = nil
    @State var isPlaceDetailViewPresented: Bool = false
    
    @State var direction: FourDirections? = nil
    @State var cardViewModel: [Place] = placesDummy
    
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
                
                CardStack(direction: FourDirections.direction, data: cardViewModel) { place, direction in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.direction = nil
                    }
                    doHapticFeedback()
                } content: { place, direction, isOnTop in
                    PlaceCardView(place: place)
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
                }
                .environment(\.cardStackConfiguration, CardStackConfiguration(
                    maxVisibleCards: 3,
                    swipeThreshold: 0.3
                ))
            }
            
            VoteEmojiOverlayView(direction: $direction)
            
            if let selectedPlace = selectedPlace, isPlaceDetailViewPresented {
                PlaceDetailView(place: selectedPlace)
            }
        }
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
