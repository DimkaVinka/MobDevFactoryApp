//
//  Teams.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 07.10.2022.
//

import Foundation

struct Teams: Codable, Hashable {
    let teams: [Team]
}

struct Team: Codable, Hashable {
    let courators: [Courator]
    let teamScore: Int
    let teamName: String
    let team: [Student]
}

struct Students: Codable, Hashable {
    let students: [Student]
}

struct Student: Codable, Hashable {
    let name: String
    let lastname: String
    let score: Int
}

struct Courators: Codable, Hashable {
    let courators: [Courator]
}

struct Courator: Codable, Hashable {
    let name: String
}


enum ListItem: Hashable {
    case header(Team)
    case body(Student)
}


enum SectionCollection {
    case main
}


enum Places: CaseIterable {
    case first
    case second
    case third
}
