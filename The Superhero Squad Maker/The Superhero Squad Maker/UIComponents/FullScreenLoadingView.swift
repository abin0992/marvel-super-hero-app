//
//  FullScreenLoadingView.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 12.02.24.
//

import SwiftUI

struct FullScreenLoadingView: View {

    var title: String

    var body: some View {
        ZStack {
            Color.white
                .opacity(0.8)
                .edgesIgnoringSafeArea(.all)

            VStack {

                ProgressView()
                    .scaleEffect(1.5, anchor: .center)
                    .progressViewStyle(CircularProgressViewStyle(tint: .primary))
                    .padding()

                Text(title)
            }
        }
    }
}
