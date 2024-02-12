//
//  HomeView.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 12.02.24.
//

import SwiftUI

struct HomeView: View {
    let viewModel = HomeViewModel()

    var body: some View {
        VStack {
        //    SquadView()
            HeroListItemView()
        }
        
    }
}

#Preview {
    HomeView()
}
