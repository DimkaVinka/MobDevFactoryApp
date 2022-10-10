//
//  DetailPersonModel.swift
//  MobDevFactoryApp
//
//  Created by Федор Донсков on 04.10.2022.
//

import UIKit

struct DetailPersons {
    let person: [DetailPerson]
}

struct DetailPerson {
    let name: String
    let photo: UIImage?
    let groupNumber: String
    let eMail: String
}
