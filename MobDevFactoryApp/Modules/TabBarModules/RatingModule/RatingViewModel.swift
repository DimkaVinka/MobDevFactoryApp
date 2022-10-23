//
//  RatingViewModel.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 07.10.2022.
//

import UIKit
import Combine




class RatingViewModel {
    
    // MARK: - Properties
    @Published var teams: Teams?
   
    
    // MARK: - Functions
    func loadTeams() {
        if let fileLocation = Bundle.main.url(forResource: "students", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let decoder = JSONDecoder()
                let dataFromeJson = try decoder.decode(Teams.self, from: data)
                self.teams = dataFromeJson
            } catch {
                print(error)
            }
        }
    }
}
