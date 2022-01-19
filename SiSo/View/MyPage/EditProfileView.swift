//
//  EditProfileView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/19.
//

import SwiftUI
import Kingfisher
import RealmSwift

struct EditProfileView: View {
    
    @State var name: String
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                ZStack {
                    KFImage(URL(string: ""))
                        .placeholder {
                            Color.gray
                        }
                        .resizable()
                        .clipShape(Circle())
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .padding(3)
                                .background(Color.white.cornerRadius(100))
                        }
                    }
                }
                .frame(width: 80, height: 80)
                .onTapGesture {
                    
                }
                
                VStack(spacing: 7) {
                    Text("이름")
                        .font(NotoSans.regular(size: 11))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("", text: $name)
                        .padding()
                        .cornerRadius(12)
                        .background(
                            Color(.systemGray6)
                                .cornerRadius(12)
                        )
                }
                Spacer()
            }
            .padding(.horizontal)
            VStack {
                Spacer()
                LargeButton(title: "확인", backgroundColor: Color(hex: "#EF9D25"), foregroundColor: .white) {
                    
                }
            }
            .padding(.horizontal)
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditProfileView(name: "구형모")
        }
    }
}
