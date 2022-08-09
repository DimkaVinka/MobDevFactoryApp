//
//  ExampleModel.swift
//  MobDevFactoryApp
//
//  Created by Дмитрий Виноградов on 08.08.2022.
//

import Foundation

struct RandomDog: Codable {
    var message: String
    var status: String
    
    static var placeholder: RandomDog {
        return RandomDog(message: "", status: "")
    }
}
