//
//  SisoWhiteButton.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/25.
//

import SwiftUI

struct SisoWhiteButtonStyle: ButtonStyle {
    let isDisabled: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let currentForegroundColor = isDisabled || configuration.isPressed ? Color.appPrimary.opacity(0.3) : Color.appPrimary
        return configuration.label
            .font(NotoSans.medium(size: 17))
            .padding(.horizontal)
            .padding(.vertical, 13)
            .foregroundColor(currentForegroundColor)
            .background(Color.white)
            // This is the key part, we are using both an overlay as well as cornerRadius
            .cornerRadius(99)
            .shadow(radius: 2)
    }
}

struct SisoWhiteButton: View {
    
    private let title: String
    private let action: () -> Void
    
    // It would be nice to make this into a binding.
    private let disabled: Bool
    
    init(title: String,
         disabled: Bool = false,
         action: @escaping () -> Void) {
        self.title = title
        self.action = action
        self.disabled = disabled
    }
    
    var body: some View {
        HStack {
            Button(action:self.action) {
                Text(self.title)
                    .frame(maxWidth:.infinity)
            }
            .buttonStyle(SisoWhiteButtonStyle(isDisabled: disabled))
                .disabled(self.disabled)
        }
        .frame(maxWidth:.infinity)
    }
}

struct SisoWhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        SisoWhiteButton(title: "Invite a Friend") {
            // noop
        }
    }
}
