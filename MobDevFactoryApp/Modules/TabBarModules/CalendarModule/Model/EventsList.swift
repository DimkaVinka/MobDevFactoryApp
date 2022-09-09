//
//  EventsList.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 09.09.2022.
//

import Foundation

class EventsList {
    
    var events: [EventModel] = { [
        EventModel(name: "Созвон", description: "Обертки свойств и анимация в SwiftUI", date: String("02.09.2022, 19:00").convertToDate()!, colorGroup: .groupCall),
        EventModel(name: "Созвон", description: "Обертки свойств и анимация в SwiftUI", date: String("09.09.2022, 19:00").convertToDate()!, colorGroup: .groupCall),
        EventModel(name: "Созвон", description: "Обертки свойств и анимация в SwiftUI", date: String("16.09.2022, 19:00").convertToDate()!, colorGroup: .groupCall),
        EventModel(name: "Созвон", description: "Обертки свойств и анимация в SwiftUI", date: String("23.09.2022, 19:00").convertToDate()!, colorGroup: .groupCall),
        EventModel(name: "Созвон", description: "Обертки свойств и анимация в SwiftUI", date: String("30.09.2022, 19:00").convertToDate()!, colorGroup: .groupCall),
        
        EventModel(name: "Новый конспект", description: "Тема 3: Массивы, наборы и словари", date: String("12.09.2022, 00:00").convertToDate()!, colorGroup: .newConspect),
        
        EventModel(name: "Открыто новое ДЗ", description: "Домашнее задание 13", date: String("05.09.2022, 00:00").convertToDate()!, colorGroup: .homeworkOpen),
        EventModel(name: "Дедлайн по ДЗ", description: "Домашнее задание 13", date: String("10.09.2022, 23:59").convertToDate()!, colorGroup: .homeworkDeadline)
        ]
    }()
}
