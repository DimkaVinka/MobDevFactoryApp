//
//  NetworkManager.swift
//  MobDevFactoryApp
//
//  Created by Дмитрий Виноградов on 08.08.2022.
//

import Foundation
import Combine

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let url = "https://dog.ceo/api/breeds/image/random"
    
    @Published private(set) var dogURL: String = "URL HERE"
    
    func fetchData() {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                fatalError("ERROR IN URL")
            } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                guard let data = data else { return }
                do {
                    let decodedData = try JSONDecoder().decode(RandomDog.self, from: data)
                    self.dogURL = decodedData.message
                } catch {
                    print("ERROR IN DECODING DATA")
                }
            }
        }.resume()
    }
}
