//
//  CalendarViewModel.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 05.11.2022.
//

import UIKit
import RealmSwift


class CalendarViewModel {
    


    func eventsForDate(date: Date) -> [EventModel]  {
        var daysEvents = [EventModel]()
        for event in EventsList().events {
            if Calendar.current.isDate(event.date, inSameDayAs: date) {
                    daysEvents.append(event)
            }
        }
        return daysEvents
    }
}
