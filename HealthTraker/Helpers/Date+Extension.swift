//
//  Date+Extension.swift
//  HealthTraker
//
//  Created by Ali on 21/12/2025.
//

import Foundation

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
}

extension Date {
    init(milliseconds: Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
    
    var isToday: Bool {
        Calendar.current.isDateInToday(self)
    }
    
    var isFuture: Bool {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let target = calendar.startOfDay(for: self)
        return target > today
    }
}
