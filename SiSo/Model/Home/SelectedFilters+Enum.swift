//
//  SelectedFilters+Enum.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/24.
//

import Foundation

class SelectedFilters: ObservableObject {
    @Published var range: Range?
    @Published var category: Category?
    @Published var price: Price?
    @Published var parking: Parking?
    
    var isEmpty: Bool {
        range == nil && category == nil && price == nil && parking == nil
    }
}

enum Range: String, CaseIterable {
    case km1 = "1km"
    case km3 = "3km"
    case km5 = "5km"
    case km10 = "10km"
}

enum Price: String, CaseIterable {
    case under10000 = "만원 이하"
    case around10000 = "1만원 대"
    case around20000 = "2만원 대"
    case over30000 = "3만원 ~"
}

enum Parking: String, CaseIterable {
    case none = "상관없음"
    case available = "가능한 곳만"
}
