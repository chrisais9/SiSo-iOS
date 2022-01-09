//
//  PreviewFilterView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/07.
//

import SwiftUI

struct PreviewFilterView: View {
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Image(systemName: "location")
                    .imageScale(.large)
                    .frame(width: 30)
                Text(" ")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .strokeBorder()
                    )
            }
            HStack {
                Image(systemName: "fork.knife")
                    .imageScale(.large)
                    .frame(width: 30)
                Text(" ")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .strokeBorder()
                    )
            }
            HStack {
                Image(systemName: "mappin.and.ellipse")
                    .imageScale(.large)
                    .frame(width: 30)
                Text(" ")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .strokeBorder()
                    )
            }
            HStack {
                Image(systemName: "wonsign.circle")
                    .imageScale(.large)
                    .frame(width: 30)
                Text(" ")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .strokeBorder()
                    )
            }
            HStack {
                Image(systemName: "car")
                    .imageScale(.large)
                    .frame(width: 30)
                Text(" ")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .strokeBorder()
                    )
            }
        }
    }
}


struct LocationFilterView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewFilterView()
    }
}
