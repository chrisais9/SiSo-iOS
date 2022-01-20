//
//  MyPageView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/11.
//

import SwiftUI
import BottomSheetSwiftUI
import RealmSwift
import Kingfisher

//enum LoginBottomSheetPosition: CGFloat, CaseIterable {
//    case middle = 0.5
//    case hidden = 0
//}

struct MyPageView: View {
    @State var bottomSheetPosition: BottomSheetPosition = .hidden
    
    @State var isGlobalNotificationEnabled = true
    @State var isMarketingNotificationEnabled = true
    
    @State var isConfirmLogoutAlertPresented = false
    @State var isProfileEditViewActive = false
    
    @ObservedRealmObject var user: User
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    VStack(spacing: 10) {
                        KFImage(URL(string: user.profileImage))
                            .placeholder {
                                Color.gray
                            }
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                        HStack(spacing: 5) {
                            Text(user.name)
                                .font(NotoSans.medium(size: 15))
                            Image(systemName: "chevron.right")
                                .font(NotoSans.medium(size: 15))
                        }
                        
                        Text("시소와 함께한 지 501일째")
                            .font(NotoSans.regular(size: 12))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    if user.loginType == .none {
                        withAnimation {
                            bottomSheetPosition = .middle
                        }
                    } else {
                        isProfileEditViewActive.toggle()
                    }
                }
                .background(
                    NavigationLink(isActive: $isProfileEditViewActive, destination: {
                        EditProfileView(user: user)
                    }, label: {
                        EmptyView()
                    })
                )
                
                Rectangle()
                    .fill(Color(UIColor.systemGroupedBackground))
                    .frame(height: 10)
                
                
                Toggle("앱 알림", isOn: $isGlobalNotificationEnabled)
                    .font(NotoSans.regular(size: 17))
                    .padding(.horizontal)
                    .padding(.bottom)
                Toggle("마케팅 수신 동의", isOn: $isMarketingNotificationEnabled)
                    .font(NotoSans.regular(size: 17))
                    .padding(.horizontal)
                
                Rectangle()
                    .fill(Color(UIColor.systemGroupedBackground))
                    .frame(height: 10)
                
                
                HStack {
                    Text("개인정보 처리 방침")
                        .font(NotoSans.regular(size: 17))
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(NotoSans.regular(size: 17))
                }
                .padding()
                
                HStack {
                    Text("이용 약관")
                        .font(NotoSans.regular(size: 17))
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(NotoSans.regular(size: 17))
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                Spacer()
                
                Button {
                    isConfirmLogoutAlertPresented.toggle()
                } label: {
                    Text("로그아웃")
                        .foregroundColor(.black)
                }
                .alert(isPresented: $isConfirmLogoutAlertPresented) {
                    let primary = Alert.Button.destructive(Text("로그아웃")) {
                        UserLoginManager.shared.doLogout()
                    }
                    let secondary = Alert.Button.cancel()
                    return Alert(title: Text("로그아웃 하시겠습니까?"), message: nil, primaryButton: primary, secondaryButton: secondary)
                }
                Spacer()
            }
            .onChange(of: user, perform: { newValue in
                withAnimation {
                    bottomSheetPosition = .hidden
                }
            })
            .bottomSheet(bottomSheetPosition: $bottomSheetPosition, options: [.tapToDissmiss, .notResizeable, .cornerRadius(15), .background(AnyView(Color.white)), .backgroundBlur(effect: .systemThinMaterialDark)], content: {
                VStack {
                    LoginView()
                }
            })
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    
    static var previews: some View {
        let user: User = User()
        user.name = "구형모"
        user.email = "chrisais9@playground.party"
        user.profileImage = "https://cdn.crowdpic.net/detail-thumb/thumb_d_C6386337D543E5BD60DB8168D08F5CFA.jpg"
        return MyPageView(user: .init(value: user))
    }
}
