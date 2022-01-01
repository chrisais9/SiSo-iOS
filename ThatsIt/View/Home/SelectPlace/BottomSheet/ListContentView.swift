//
//  ListContentView.swift
//  ThatsIt
//
//  Created by 구형모 on 2022/01/01.
//

import SwiftUI

struct ListContentView: View {
    
    @Binding var bottomSheetPosition: CustomBottomSheetPosition
    var body: some View {
        VStack {
            if bottomSheetPosition == .top {
                ScrollView {
                    ForEach(0..<10) { i in
                        MyPlaceRow()
                            .padding(.top)
                            .padding(.horizontal)
                    }
                }
                .padding(.top)
                LargeButton(title: "투표 하러가기", backgroundColor: .gray, foregroundColor: .white) {
                    
                }
                .padding(.horizontal)
            }
        }
    }
}

struct ListContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListContentView(bottomSheetPosition: .constant(CustomBottomSheetPosition.top))
    }
}
