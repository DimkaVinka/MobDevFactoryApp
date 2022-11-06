//
//  LessonsStorageManager.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 20.10.2022.
//

import Foundation
import RealmSwift


//protocol PrimaryKeyAware {
//  var id: Int { get }
//  static func primaryKey() -> String?
//}

//class RealmBlocks: Object {
//    var blocks = List<RealmBlock>()
//}
//
//class RealmBlock: Object {
//    @Persisted var block_name: String = ""
//    var cource = List<RealmCource>()
//    var homework = List<RealmHomework>()
//    
//    @Persisted var blockID = UUID().uuidString
//}
//
//class RealmCource: Object {
//    @Persisted var cource_name: String = ""
//    @Persisted var cource_link: String = ""
//    @Persisted var cource_opening_time: String = ""
//}
//
//class RealmHomework: Object {
//    @Persisted var homework_opening_time: String = ""
//    @Persisted var homework_link: String = ""
//    @Persisted var homework_number: Int = 0
//    @Persisted var homework_deadline_time: String = ""
//}

//class BlocksStorageManager {
//    
//    let realm = try! Realm()
//
//    var blocks: Results<RealmBlock>!
//    
//    func loadBlocks() {
//        if let fileLocation = Bundle.main.url(forResource: "cources", withExtension: "json") {
//            do {
//                let data = try Data(contentsOf: fileLocation)
//                try! realm.write {
//                    let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions())
//                    realm.deleteAll()
//                    realm.create(RealmBlocks.self, value: json, update: .modified)
//                    self.blocks = realm.objects(RealmBlock.self)
//                }
//            } catch {
//                print(error)
//            }
//        }
//    }
//}
