//
//  Teams.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 07.10.2022.
//

import Foundation

struct Teams: Codable {
    let teams: [Team]
}

struct Team: Codable {
    let courators: Courators
    let teamScore: Int
    let teamName: String
    let team: [Student]
}

struct Student: Codable {
    let name: String
    let lastname: String
    let score: Int
}

struct Courators: Codable {
    let courators: [Courator]

}

struct Courator: Codable {
    let name: String
}
