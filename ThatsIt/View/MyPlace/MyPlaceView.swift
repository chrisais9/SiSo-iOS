//
//  MyPlaceView.swift
//  ThatsIt
//
//  Created by 구형모 on 2021/12/25.
//

import SwiftUI

struct MyPlaceView: View {
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("나의 장소")
                    .font(NotoSans.bold(size: 23))
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    Spacer()
                    Text("총 10개")
                        .font(NotoSans.regular(size: 13))
                        .foregroundColor(.gray)
                        .padding(.trailing)
                }
                ScrollView {
                    LazyVStack {
                        ForEach(0..<10) { i in
                            MyPlaceRow()
                        }
                        
                    }.padding(.horizontal)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct MyPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        MyPlaceView()
    }
}
