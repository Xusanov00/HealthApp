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
