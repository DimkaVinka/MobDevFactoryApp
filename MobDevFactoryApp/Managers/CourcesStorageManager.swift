//
//  LessonsStorageManager.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 20.10.2022.
//

import Foundation
import RealmSwift


class FavoriteCource: Object {
    @Persisted var cource_name: String = ""
    @Persisted var cource_link: String = ""
    @Persisted var cource_opening_time: String = ""
}

class CourcesStorageManager {
    
    let realm = try! Realm()
    var items: Results<FavoriteCource>!

    // MARK: - Обращание к хранилищу
    func makeStorage() {
        items = realm.objects(FavoriteCource.self)
    }

    // MARK: - Добавление данных
    func addCource(_ cource: FavoriteCource) {
        try! self.realm.write({
            self.realm.add(cource)
            print("Cource has ben added")
        })
    }

    // MARK: - Удаление данных
    func deleteCource(_ cource: FavoriteCource) {
        try! self.realm.write {
            self.realm.delete(cource)
            print("Cource has ben deleted")
        }
    }
}
