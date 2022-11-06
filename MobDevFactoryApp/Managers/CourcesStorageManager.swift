//
//  LessonsStorageManager.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 20.10.2022.
//

import Foundation
import RealmSwift

//class RealmCource: Object {
//    @Persisted var cource_name: String = ""
//    @Persisted var cource_link: String = ""
//    @Persisted var cource_opening_time: String = ""
//}

class RealmBlocks: Object {
    @Persisted(primaryKey: true) var _id: String
    var blocks = List<RealmBlock>()
    
    override static func primaryKey() -> String? {
      return "blocksID"
    }
}

class RealmBlock: Object {
    @Persisted var block_name: String = ""
    var cource = List<RealmCource>()
    var homework = List<RealmHomework>()
}

class RealmCource: Object {
    @Persisted var cource_name: String = ""
    @Persisted var cource_link: String = ""
    @Persisted var cource_opening_time: String = ""
}

class RealmHomework: Object {
    @Persisted var homework_opening_time: String = ""
    @Persisted var homework_link: String = ""
    @Persisted var homework_number: Int = 0
    @Persisted var homework_deadline_time: String = ""
}

class BlocksStorageManager {
    
    let realm = try! Realm()
    var allBlocks: Results<RealmBlock>!

    // MARK: - Обращание к хранилищу
    func makeStorage() {
        allBlocks = realm.objects(RealmBlock.self)
    }
            
    // MARK: - Добавление данных
    func addBlock(_ block: RealmBlock) {
        try! self.realm.write({
            self.realm.add(block)
            print("Block has ben added")
        })
    }

    // MARK: - Удаление данных
    func deleteBlock(_ block: RealmBlock) {
        try! self.realm.write {
            self.realm.delete(block)
            print("Block has ben deleted")
        }
    }
}
