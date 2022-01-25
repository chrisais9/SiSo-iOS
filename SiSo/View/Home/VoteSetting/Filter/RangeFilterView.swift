//
//  RangeFilterView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/10.
//

import SwiftUI

struct RangeFilterView: View {
    
    @Binding var isShowing: Bool
    
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var selectedFilters: SelectedFilters
    
    var body: some View {
        if isShowing {
            content
        }
    }
    
    var content: some View {
        GeometryReader { proxy in
            ZStack {
                VisualEffectView(uiVisualEffect: UIBlurEffect(style: .dark))
                    .ignoresSafeArea()
                    .opacity(0.9)
                    .transition(.opacity)
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.25)) {
                            isShowing.toggle()
                        }
                    }
//                Color.black.opacity(0.4)
//                    .ignoresSafeArea()
//                    .transition(.opacity)
//                    .onTapGesture {
//                        withAnimation(.linear(duration: 0.25)) {
//                            isShowing.toggle()
//                        }
//                    }
                VStack {
                    Text("반경")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    LazyVGrid(columns: columns, alignment: .leading) {
                        ForEach(FilterRange.allCases, id: \.self) { range in
                            Button {
                                selectedFilters.range = range
                            } label: {
                                Text(range.rawValue)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 15)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 3)
                                            .strokeBorder(lineWidth: range == selectedFilters.range ? 3 : 1)
                                    )
                                    .foregroundColor(.black)
                            }
                            
                        }
                    }
                }
                .padding()
                .frame(width: proxy.size.width * 0.9)
                .cornerRadius(10)
                .background(Color.white.cornerRadius(10))
            }
        }
    }
}

struct RangeFilterView_Previews: PreviewProvider {
    static var previews: some View {
        RangeFilterView(isShowing: .constant(true), selectedFilters: SelectedFilters())
    }
}
