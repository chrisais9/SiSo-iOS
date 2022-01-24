//
//  DeckDetailView.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/24.
//

import SwiftUI
import Kingfisher

struct DeckDetailView: View {
    
    var place: Place = placeDummy
    
    @State var isVoteViewActive: Bool = false
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    KFImage.url(URL(string: place.image))
                        .resizable()
                        .frame(height: 300)
                    
                    
                    Text("김부장이 추천하는 고오급 맛집🥸")
                        .font(NotoSans.bold(size: 19))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    HStack {
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(.orange)
                        Text("1,201")
                            .font(NotoSans.regular(size: 17))
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Group {
                        PlaceMenuRow(image: "https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20180919_13%2F1537334853345O2bsh_JPEG%2FGQiNDnJMqcJsM8vkI-WGBc4T.JPG.jpg", name: "본보야지", description: "여의도 ifc점 스테이크 파스타 맛있는 레스토랑")
                        PlaceMenuRow(image: "https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20201123_234%2F1606088369071MRBEQ_JPEG%2F0YkoxDH6sepa4QqpzU5rfgIS.jpg", name: "오복수산 여의도점", description: "오복수산 여의도점은 타 지점과 달리 모듬스시가 판매되고 있습니다")
                        PlaceMenuRow(image: "https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210423_99%2F1619140686159kzdz9_JPEG%2Fcon200529_510.jpg", name: "콘래드서울 제스트", description: "제스트는 아침, 점심, 저녁 식사가 가능한 뷔페입니다")
                        PlaceMenuRow(image: "https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20191017_267%2F1571278507861earXq_JPEG%2F012_%25BD%25BA%25C5%25D7%25C0%25CC%25C5%25A9%25C7%25CF%25BF%25EC%25BD%25BA_%25C0%25CD%25BD%25BA%25C5%25D7%25B8%25AE%25BE%25EE_20191010_%25BF%25F8%25BA%25BB_VMU.jpg", name: "더 스테이크 하우스 여의도 IFC점", description: "더스테이크하우스에서 홀그레인소스를 곁들인 채끝스테이크")
                    }
                    .padding(.horizontal)
                }
            }
            .ignoresSafeArea(.container, edges: .top)
            VStack {
                LargeButton(title: "이 덱으로 투표 시작", backgroundColor: Color(hex: "#EF9D25"), foregroundColor: .white) {
                    isVoteViewActive.toggle()
                }
                .background(
                    NavigationLink(isActive: $isVoteViewActive, destination: {
                        VoteView()
                    }, label: {
                        EmptyView()
                    })
                )
            }
            .padding(.horizontal)
        }
    }
}

struct DeckDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DeckDetailView()
        }
    }
}
