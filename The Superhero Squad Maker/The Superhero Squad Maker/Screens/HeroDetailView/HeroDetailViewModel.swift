//
//  HeroDetailViewModel.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 13.02.24.
//

import Combine
import Foundation

final class HeroDetailViewModel: ObservableObject {

    private(set) var output = PassthroughSubject<Void, Never>()

    @Published var heroViewModel: Hero

    init(heroViewModel: Hero) {
        self.heroViewModel = heroViewModel
    }
}
