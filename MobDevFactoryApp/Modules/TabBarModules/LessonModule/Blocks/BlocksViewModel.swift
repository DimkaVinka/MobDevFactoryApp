//
//  BlocksViewModel.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 30.09.2022.
//

import UIKit
import Combine
import RealmSwift

class BlocksViewModel {
    
    // MARK: - Properties
    @Published var blocks: Results<RealmBlock>?
    let storageManager = BlocksStorageManager()
    
    // MARK: - Functions
    func loadBlocks() {
        if let fileLocation = Bundle.main.url(forResource: "cources", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                try! storageManager.realm.write {
                    let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions())
                    storageManager.realm.create(RealmBlocks.self, value: json, update: .modified)
                    self.blocks = storageManager.realm.objects(RealmBlock.self)
                }
            } catch {
                print(error)
            }
        }
    }
}


//func loadBlocks() {
//    if let fileLocation = Bundle.main.url(forResource: "cources", withExtension: "json") {
//        do {
//            let data = try Data(contentsOf: fileLocation)
//            let decoder = JSONDecoder()
//            let dataFromeJson = try decoder.decode(Blocks.self, from: data)
//            self.blocks = dataFromeJson.blocks
//        } catch {
//            print(error)
//        }
//    }
//}
