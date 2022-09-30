//
//  LessonsViewModel.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 30.09.2022.
//

import UIKit


class LessonsViewModel {
    
    // MARK: - Properties
    var block: Block
    let view = BlocksView()
    
    let cources: [Cource]
    
    init(block: Block) {
        self.block = block
        self.cources = block.cource
    }
}

