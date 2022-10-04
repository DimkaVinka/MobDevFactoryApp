//
//  PersonModel.swift
//  MobDevFactoryApp
//
//  Created by Федор Донсков on 04.10.2022.
//

import UIKit

struct Persons {
    let person: [Person]
}

struct Person {
    let name: String
    let photo: UIImage?
    let status: String?
    let groupNumber: String
    let eMail: String
}
