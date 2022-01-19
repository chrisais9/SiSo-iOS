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
    
    @ObservedResults(User.self) var user
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        Spacer()
                        if let user = user.first {
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
                                        .font(NotoSans.regular(size: 15))
                                    Image(systemName: "chevron.right")
                                        .imageScale(.small)
                                }
                                Text("시소와 함께한 지 501일째")
                                    .font(NotoSans.regular(size: 12))
                                    .foregroundColor(.gray)
                            }
                        } else {
                            ProgressView()
                                .onAppear {
                                    $user.append(User())
                                }
                        }
                        Spacer()
                    }
                }
                .padding()
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        bottomSheetPosition = .middle
                    }
                }
                
                Section {
                    Toggle("앱 알림", isOn: $isGlobalNotificationEnabled)
                    Toggle("마케팅 수신 동의", isOn: $isMarketingNotificationEnabled)
                } header: {
                    Text("알림 설정")
                }
                
                Section {
                    NavigationLink("개인정보 처리 방침") {
                        
                    }
                    NavigationLink("이용 약관") {
                        
                    }
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
                    
                }
                
            }
        }
        .onChange(of: user, perform: { newValue in
            withAnimation {
                bottomSheetPosition = .hidden
            }
        })
        .bottomSheet(bottomSheetPosition: $bottomSheetPosition, options: [.tapToDissmiss, .notResizeable, .cornerRadius(15), .background(AnyView(Color.white)), .backgroundBlur(effect: .systemThinMaterialDark)], content: {
            LoginView()
        })
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MyPageView_Previews: PreviewProvider {
    init() {
        MyPageView_Previews.createData()
    }
    static var previews: some View {
        return NavigationView {
            MyPageView()
        }
    }
    
    static func createData() {
        let realm = try! Realm()
        let user = User()
        user.name = "로그인 해주세요"
        try! realm.write {
            realm.deleteAll()
            realm.add(user)
        }
    }
}
