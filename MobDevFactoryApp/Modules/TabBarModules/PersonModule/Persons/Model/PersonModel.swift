//
//  PersonModel.swift
//  MobDevFactoryApp
//
//  Created by Федор Донсков on 04.10.2022.
//

import Foundation
import UIKit
import RealmSwift

class PersonModel: Object {
    var profileImage: UIImage = UIImage()
    @objc dynamic var statusImage: String = ""
    @objc dynamic var firstName: String = ""
    @objc dynamic var groupLabel: String = ""
    @objc dynamic var cityLabel: String = ""
    @objc dynamic var emailLabel: String = ""
}
