//
//  TextField+ClearButton.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/26.
//

import SwiftUI

struct TextFieldClearButton: ViewModifier {
    @Binding var text: String
    
    func body(content: Content) -> some View {
        HStack {
            content
            if !text.isEmpty {
                Button(
                    action: { self.text = "" },
                    label: {
                        Image(systemName: "multiply.circle.fill")
                            .foregroundColor(Color(UIColor.opaqueSeparator))
                    }
                )
            }
        }
    }
}
