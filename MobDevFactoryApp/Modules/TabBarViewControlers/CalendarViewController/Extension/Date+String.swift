//
//  Date+String.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 09.09.2022.
//

import Foundation

import Foundation

// MARK: - Date extension

extension Date {
    public func convertToString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy, HH:mm"
        return formatter.string(from: self)
    }
    
    public func timeString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
}

// MARK: - String extension

extension String {
    public func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy, HH:mm"
        return dateFormatter.date(from: self)
    }
}
