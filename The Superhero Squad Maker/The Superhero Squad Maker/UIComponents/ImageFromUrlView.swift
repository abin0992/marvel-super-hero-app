//
//  ImageFromUrlView.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 13.02.24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageFromUrlView: View {

    let basePath: String
    let size: ImageSize
    let fileExtension: FileExtension

    var body: some View {
        WebImage(
            url: ImageEndpoint(
                basePath: basePath,
                size: size,
                fileExtension: fileExtension
            ).url
        )
        .resizable()
        .placeholder(Image("marvel-logo-square"))
        .aspectRatio(contentMode: .fill)
    }
}
