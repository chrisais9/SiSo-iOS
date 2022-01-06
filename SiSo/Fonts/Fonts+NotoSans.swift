//
//  Fonts+NotoSans.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/25.
//

import SwiftUI

struct NotoSans {
    
    static func black(size: CGFloat) -> Font{
            return Font.custom("NotoSansKR-Black", size: size)
    }
    
    static func bold(size: CGFloat) -> Font {
            return Font.custom("NotoSansKR-Bold", size: size)
    }
    
    static func demiLight(size: CGFloat) -> Font {
            return Font.custom("NotoSansKR-DemiLight", size: size)
    }
    
    static func light(size: CGFloat) -> Font {
            return Font.custom("NotoSansKR-Light", size: size)
    }
    
    static func medium(size: CGFloat) -> Font {
            return Font.custom("NotoSansKR-Medium", size: size)
    }
    
    static func regular(size: CGFloat) -> Font {
            return Font.custom("NotoSansKR-Regular", size: size)
    }
    
    static func thin(size: CGFloat) -> Font {
            return Font.custom("NotoSansKR-Thin", size: size)
    }
}
