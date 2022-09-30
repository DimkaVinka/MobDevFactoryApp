//
//  Blocks.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 30.09.2022.
//

import Foundation

struct Blocks: Codable {
    let blocks: [Block]
}

struct Block: Codable {
    let block_name: String
    let cource: [Cource]
    let homework: [Homework]?
}

struct Cource: Codable {
    let cource_name: String
    let cource_link: String
    let cource_opening_time: String
}

struct Homework: Codable {
    let homework_opening_time: String
    let homework_link: String
    let homework_number: Int
    let homework_deadline_time: String
}
