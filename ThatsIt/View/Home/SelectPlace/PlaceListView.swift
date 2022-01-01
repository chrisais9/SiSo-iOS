//
//  PlaceListView.swift
//  ThatsIt
//
//  Created by 구형모 on 2022/01/01.
//

import SwiftUI

struct PlaceListView: View {
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(0..<10) { i in
                        MyPlaceRow()
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top)
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView()
    }
}
