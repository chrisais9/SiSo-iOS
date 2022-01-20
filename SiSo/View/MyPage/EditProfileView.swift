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
    
    @ObservedRealmObject var user: User
    @Environment(\.presentationMode) var mode
    
    @State var isPhotoPickerPresented: Bool = false
    @State var selectedPhoto: UIImage? = nil
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                ZStack {
                    KFImage(URL(string: user.profileImage))
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
                    isPhotoPickerPresented.toggle()
                }
                .sheet(isPresented: $isPhotoPickerPresented) {
                    
                } content: {
                    PhotoPickerView(image: $selectedPhoto)
                }
                
                
                VStack(spacing: 7) {
                    Text("이름")
                        .font(NotoSans.regular(size: 11))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("", text: $user.name)
                        .padding(10)
                        .font(NotoSans.regular(size: 15))
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
                    self.mode.wrappedValue.dismiss()
                }
                .padding(.horizontal)
            }
            .ignoresSafeArea(.keyboard)
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let user: User = User()
        user.name = "구형모"
        user.email = "chrisais9@playground.party"
        user.profileImage = "https://cdn.crowdpic.net/detail-thumb/thumb_d_C6386337D543E5BD60DB8168D08F5CFA.jpg"
        return NavigationView {
            EditProfileView(user: user)
        }
    }
}
