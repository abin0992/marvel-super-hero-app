//
//  View+Extensions.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 13.02.24.
//

import SwiftUI

extension View {

    func navigationBarBackButton(action: @escaping () -> Void) -> some View {
        toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    action()
                } label: {
                    Image("back-button")
                        .tint(Color.accentColor)
                }
            }
        }
    }

    func navigationBarColor(
        backgroundColor: UIColor,
        foregroundColor: UIColor
    ) -> some View {
        self.modifier(
            NavigationBarColorModifier(
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor
            )
        )
    }
}
