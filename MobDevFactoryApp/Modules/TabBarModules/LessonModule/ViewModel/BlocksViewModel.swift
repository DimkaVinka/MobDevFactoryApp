//
//  BlocksViewModel.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 30.09.2022.
//

import UIKit

class BlocksViewModel {
    
    // MARK: - Properties
    var blocks: [Block]
    let view = BlocksView()
    
    init(blocks: [Block]) {
        self.blocks = blocks
    }
    
    // MARK: - Functions
    func loadBlocks() {
        if let fileLocation = Bundle.main.url(forResource: "cources", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let decoder = JSONDecoder()
                let dataFromeJson = try decoder.decode(Blocks.self, from: data)
                self.blocks = dataFromeJson.blocks
            } catch {
                print(error)
            }
        }
    }
}
