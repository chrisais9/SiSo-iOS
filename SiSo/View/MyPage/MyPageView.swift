//
//  MyPageView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/11.
//

import SwiftUI
import BottomSheetSwiftUI

//enum LoginBottomSheetPosition: CGFloat, CaseIterable {
//    case middle = 0.5
//    case hidden = 0
//}

struct MyPageView: View {
    @State var bottomSheetPosition: BottomSheetPosition = .hidden
    
    @State var isGlobalNotificationEnabled = true
    @State var isMarketingNotificationEnabled = true
    
    var body: some View {
        VStack(spacing: 10) {
            Form {
                Section {
                    HStack {
                        Spacer()
                        VStack(spacing: 10) {
                            Image("profile_dummy")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 50, height: 50)
                            HStack(spacing: 5) {
                                Text("구형모")
                                    .font(NotoSans.regular(size: 15))
                                Image(systemName: "chevron.right")
                                    .imageScale(.small)
                            }
                            Text("시소와 함께한 지 501일째")
                                .font(NotoSans.regular(size: 12))
                                .foregroundColor(.gray)
                        }
                        .padding()
                        Spacer()
                    }
                }.onTapGesture {
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
                        
                    } label: {
                        Text("로그아웃")
                            .foregroundColor(.black)
                    }
                    
                }
                
            }
            .bottomSheet(bottomSheetPosition: $bottomSheetPosition, options: [.tapToDissmiss, .notResizeable, .cornerRadius(15)], content: {
                VStack {
                    LoginView()
                }
            })
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        

    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyPageView()
        }
    }
}
