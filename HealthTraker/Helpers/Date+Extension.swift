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

enum ChartRange {
    case day
    case week
    case month
}

extension Date {
    
    /// Возвращает отформатированную строку для графика в зависимости от типа диапазона
    /// - Parameter range: Тип диапазона (день/неделя/месяц)
    /// - Returns: Отформатированная строка
    func chartLabel(for range: ChartRange) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale.current // Автоматическая локализация
        
        switch range {
        case .day:
            // "Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"
            formatter.dateFormat = "EE"
            let result = formatter.string(from: self)
            // удаление точку если есть и возврат первых 2 символа
            return String(result.replacingOccurrences(of: ".", with: "").prefix(2)).capitalized
            
        case .week:
            // "04.09", "11.09", "18.09"
            formatter.dateFormat = "dd.MM"
            return formatter.string(from: self)
            
        case .month:
            // "Янв", "Фев", "Мар", "Апр", "Май", "Июн", "Июл", "Авг", "Сен", "Окт", "Ноя", "Дек"
            formatter.dateFormat = "LLL"
            let result = formatter.string(from: self)
            // Убираем точку если есть и капитализируем
            return result.replacingOccurrences(of: ".", with: "").capitalized
        }
    }
}

extension TimeInterval {
    func dateString(for range: ChartRange) -> String {
        let date = Date(timeIntervalSince1970: self)
        return date.chartLabel(for: range)
    }
}

extension TimeInterval {
    var toDate: Date {
        return Date(timeIntervalSince1970: self)
    }
    
    /// Конвертирует timestamp в отформатированную строку для графика
    func chartLabel(for range: ChartRange) -> String {
        return toDate.chartLabel(for: range)
    }
}
