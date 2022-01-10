//
//  PreviewFilterView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/07.
//

import SwiftUI

struct PreviewFilterView: View {
    var body: some View {
        VStack {
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
            .padding(.vertical)
            .contentShape(Rectangle())
            .onTapGesture {
                setLocation()
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
            .padding(.vertical)
            .contentShape(Rectangle())
            .onTapGesture {
                setCategory()
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
            .padding(.vertical)
            .contentShape(Rectangle())
            .onTapGesture {
                setRange()
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
            .padding(.vertical)
            .contentShape(Rectangle())
            .onTapGesture {
                setPrice()
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
            .padding(.vertical)
            .contentShape(Rectangle())
            .onTapGesture {
                setParking()
            }
        }
    }
    
    func setLocation() {
        
    }
    
    func setCategory() {
        
    }

    func setRange() {
        
    }

    func setPrice() {
        
    }

    func setParking() {
        
    }

}


struct LocationFilterView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewFilterView()
    }
}
