//
//  CustomAlert.swift
//  SiSo
//
//  Created by 구형모 on 2021/12/21.
//

import SwiftUI

struct SimpleDialog<DialogContent: View>: ViewModifier {
    @Binding var isShowing: Bool // set this to show/hide the dialog
    let dialogContent: DialogContent
    
    init(isShowing: Binding<Bool>,
         @ViewBuilder dialogContent: () -> DialogContent) {
        _isShowing = isShowing
        self.dialogContent = dialogContent()
    }
    
    func body(content: Content) -> some View {
        // wrap the view being modified in a ZStack and render dialog on top of it
        ZStack {
            content
            if isShowing {
                // the semi-transparent overlay
                Rectangle().foregroundColor(Color.black.opacity(0.6)).ignoresSafeArea()
                // the dialog content is in a ZStack to pad it from the edges
                // of the screen
                ZStack {
                    dialogContent
                    .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(.white)
                    )
                }.padding(40)
            }
        }
    }
}

extension View {
    func simpleDialog<DialogContent: View>(
        isShowing: Binding<Bool>,
        @ViewBuilder dialogContent: @escaping () -> DialogContent
    ) -> some View {
        self.modifier(SimpleDialog(isShowing: isShowing, dialogContent: dialogContent))
    }
}


struct SimpleDialog_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
        }.simpleDialog(isShowing: .constant(true)) {
            VStack {
                Text("Dialog title")
                    .fontWeight(.bold)
                    .padding(.vertical, 13)
                Text("Some longer description")
                    .padding(.bottom, 13)
                
                Divider()
                Button(action: {
                    
                }) {
                    Text("Close dialog")
                        .autocapitalization(.allCharacters)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.bottom)
                }
            }
        }
    }
}
