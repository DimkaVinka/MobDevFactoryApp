//
//  CalendarViewModel.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 05.11.2022.
//

import UIKit


class CalendarViewModel {
    
    let realm = BlocksStorageManager().realm

    func eventsForDate(date: Date) -> [RealmCource]  {
        var daysEvents = [RealmCource]()
        for event in realm.objects(RealmCource.self) {
            if let eventDate = (event.cource_opening_time).convertToDate() {
                if Calendar.current.isDate(eventDate, inSameDayAs: date) {
                    daysEvents.append(event)
                }
            }
        }
        return daysEvents
    }
}
