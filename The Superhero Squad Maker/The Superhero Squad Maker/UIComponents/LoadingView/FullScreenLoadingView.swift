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
            Color.greyDark
                .opacity(0.8)
                .edgesIgnoringSafeArea(.all)

            VStack {
                ProgressView()
                    .scaleEffect(1.5, anchor: .center)
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .padding()

                Text(title)
                    .font(.title3)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}
