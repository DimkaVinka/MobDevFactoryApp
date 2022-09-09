//
//  StorageManager.swift
//  MobDevFactoryApp
//
//  Created by Дмитрий Виноградов on 13.08.2022.
//

import Foundation
import RealmSwift

class User: Object {
    @Persisted var nickName: String = ""
    @Persisted var name: String = ""
    @Persisted var surName: String = ""
    @Persisted var password: String = ""
//    @Persisted var isLogged: Bool = true
}

class StorageManager {
    let realm = try! Realm()
    var items: Results<User>!
    
    // MARK: - Обращание к хранилищу
    func makeStorage() {
        items = realm.objects(User.self)
    }
    
    // MARK: - Добавление данных
    func addUser(_ user: User) {
        try! self.realm.write({
            self.realm.add(user)
        })
    }
    
    // MARK: - Удаление данных
    func deleteUser(_ user: User) {
        try! self.realm.write {
            self.realm.delete(user)
        }
    }
}
