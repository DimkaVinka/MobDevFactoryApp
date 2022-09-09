//
//  EventModel.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 09.09.2022.
//

import Foundation

struct EventModel {
    let name: String
    let description: String
    let date: Date
    let colorGroup: ColorGroups
    
    enum ColorGroups: CaseIterable {
        case groupCall
        case newConspect
        case homeworkOpen
        case homeworkDeadline
    }
}
