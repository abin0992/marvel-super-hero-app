//
//  ModuleAssembly.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 12.02.24.
//

import Foundation
import Swinject

final class ModuleAssembly {

    static let all: [Assembly] = [
        HomeScreenAssembly()
     //   CoinDetailAssembly()
    ]

}

final class HomeScreenAssembly: Assembly {

    func assemble(container: Container) {

        container.register(FetchHeroListUseCaseProtocol.self) { resolver in
            FetchHeroListUseCase(
                heroService: resolver.resolve(HeroFetchable.self)!
            )
        }

        container.register(HomeViewModel.self) { resolver in
            HomeViewModel(
                fetchHeroListUseCase: resolver.resolve(FetchHeroListUseCaseProtocol.self)!
            )
        }
//
//        container.register(CryptoLogoViewModel.self) { resolver, coinId, coinImageUrl in
//            CryptoLogoViewModel(
//                coinId: coinId,
//                coinImageUrl: coinImageUrl,
//                fetchCryptoLogoUseCase: resolver.resolve(FetchCryptoLogoUseCaseProtocol.self)!
//            )
//        }
//
//        container.register(FetchCryptoPricesUseCaseProtocol.self) { resolver in
//            FetchCryptoPricesUseCase(
//                cryptoService: resolver.resolve(CryptoFetchable.self)!
//            )
//        }
    }
}

//final class CoinDetailAssembly: Assembly {
//
//    func assemble(container: Container) {
//
//        container.register(CoinDetailViewModel.self) { resolver, coin in
//            CoinDetailViewModel(
//                fetchCrypoDetailUseCase: resolver.resolve(FetchCrypoDetailUseCaseProtocol.self)!,
//                coin: coin
//            )
//        }
//
//        container.register(FetchCrypoDetailUseCaseProtocol.self) { resolver in
//            FetchCrypoDetailUseCase(
//                cryptoService: resolver.resolve(CryptoFetchable.self)!
//            )
//        }
//    }
//}
