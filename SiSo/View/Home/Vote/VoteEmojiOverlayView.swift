//
//  VoteEmojiOverlayView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/04.
//

import SwiftUI

struct VoteEmojiOverlayView: View {
    
    @Binding var direction: FourDirections?
    
    let coverOpacity: CGFloat = 0.1
    let coverRelativeSize: CGFloat = 0.4
    
    let topBackground: LinearGradient = LinearGradient(colors: [Color.black.opacity(0.4), Color.black.opacity(0.001)], startPoint: .top, endPoint: .bottom)
    let leadingBackground: LinearGradient = LinearGradient(colors: [Color.black.opacity(0.4), Color.black.opacity(0.001)], startPoint: .leading, endPoint: .trailing)
    let trailingBackground: LinearGradient = LinearGradient(colors: [Color.black.opacity(0.4), Color.black.opacity(0.001)], startPoint: .trailing, endPoint: .leading)
    let bottomBackground: LinearGradient = LinearGradient(colors: [Color.black.opacity(0.4), Color.black.opacity(0.001)], startPoint: .bottom, endPoint: .top)
    
    
    
    var body: some View {
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
                .background(topBackground)
                .frame(height: proxy.size.height * coverRelativeSize)
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
                    .frame(width: proxy.size.width * coverRelativeSize)
                }
                .background(leadingBackground)
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
                    .frame(width: proxy.size.width * coverRelativeSize)
                    .background(trailingBackground)
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
                    .background(bottomBackground)
                    .frame(height: proxy.size.height * coverRelativeSize)
                    .opacity(direction == .bottom ? 1 : 0)
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct VoteEmojiOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        VoteEmojiOverlayView(direction: .constant(FourDirections.top))
    }
}
