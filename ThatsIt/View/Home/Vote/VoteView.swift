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
                
                CardStack(direction: FourDirections.direction, data: cardViewModel) { card, direction in
                    print("swipe to \(direction) \(self.direction.debugDescription)")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.direction = nil
                    }
                    doHapticFeedback()
                } content: { place, direction, isOnTop in
                    VStack {
                        WebImage(url: URL(string: place.image))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text(place.name)
                                    .font(NotoSans.bold(size: 21))
                                    .lineLimit(1)
                                Text("\(place.location) | \(place.category.rawValue)")
                                    .font(NotoSans.regular(size: 13))
                            }
                            .layoutPriority(100)
                            
                            Spacer()
                        }
                        .padding()
                    }
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 4)
                    .padding([.top, .horizontal])
                    .onChange(of: direction, perform: { newValue in
                        self.direction = newValue
                    })
                }
                .environment(\.cardStackConfiguration, CardStackConfiguration(
                    maxVisibleCards: 3,
                    swipeThreshold: 0.3
                ))
            }
            VStack {
                GeometryReader { proxy in
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Image(systemName: "triangle")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.yellow)
                            Spacer()
                        }
                        Spacer()
                    }
                    .background(
                        Color.black.opacity(0.3)
                    )
                    .frame(height: proxy.size.height * 0.3)
                    .opacity(direction == .top ? 1 : 0)
                    
                    HStack {
                        VStack {
                            Spacer()
                            Image(systemName: "hand.thumbsup")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.green)
                            Spacer()
                        }
                        .frame(width: proxy.size.width * 0.3)
                    }
                    .background(
                        Color.black.opacity(0.3)
                    )
                    .opacity(direction == .left ? 1 : 0)
                    
                    HStack {
                        Spacer()
                        VStack {
                            Spacer()
                            Image(systemName: "hand.thumbsdown")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.red)
                            Spacer()
                        }
                        .frame(width: proxy.size.width * 0.3)
                        .background(
                            Color.black.opacity(0.3)
                        )
                        .opacity(direction == .right ? 1 : 0)
                    }
                    
                    VStack {
                        Spacer()
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Image(systemName: "triangle")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.yellow)
                                Spacer()
                            }
                            Spacer()
                        }
                        .background(
                            Color.black.opacity(0.3)
                        )
                        .frame(height: proxy.size.height * 0.3)
                        .opacity(direction == .bottom ? 1 : 0)
                    }
                }
            }
            .ignoresSafeArea()
            
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
