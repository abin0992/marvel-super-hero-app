//
//  HomeViewModel.swift
//  The Superhero Squad Maker
//
//  Created by Abin Baby on 12.02.24.
//

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    @Published var characters: [Hero] = []
    @Published var isLoading = false
    
    private var offset = 0
    private var limit = 20
    private var total = 0
    private var subscriptions = Set<AnyCancellable>()

    
    init() {
        loadMoreCharacters()
    }
    
    func loadMoreCharacters() {
        guard !isLoading && (characters.count < total || total == 0) else {
            return
        }
        
        isLoading = true
//        guard let url =  else {
//            print("Invalid URL")
//            isLoading = false
//            return
//        }
            let timestamp = String(Date().timeIntervalSince1970)
        let hash = Security.Hashing.MD5.hashHexString(from: "\(timestamp)\(AppConfiguration.privateKey)\(AppConfiguration.publicKey)") // Assuming you have an MD5 function available

            let urlStr = "https://gateway.marvel.com/v1/public/characters?ts=\(timestamp)&apikey=\(AppConfiguration.publicKey)&hash=\(hash)"
            guard let url = URL(string: urlStr) else {
                return
            }
        print(url)
        let url1 = SquadUrlConfig.shared.fetchSquadList(offset: "0").url
        print(url1)
        URLSession.shared.dataTaskPublisher(for: url1)
            .map(\.data)
            .decode(type: SquadListResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    print("Error fetching data: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] response in
                print(response)
                self?.characters.append(contentsOf: response.data.results)
                self?.offset += response.data.count
                self?.total = response.data.total
            })
            .store(in: &subscriptions)
    }
}
