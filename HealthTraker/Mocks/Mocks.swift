//
//  Mocks.swift
//  HealthTraker
//
//  Created by Ali on 18/12/2025.
//

import Foundation

struct Mocks {
    static func recoveryData(range: ChartRange) -> [HealthInfoDM] {
        switch range {
        case .day:
            [
                .init(date: date("2023-09-04"), value: 100, label: "Mon"),
                .init(date: date("2023-09-05"), value: 53, label: "Tue"),
                .init(date: date("2023-09-06"), value: 62, label: "Wed"),
                .init(date: date("2023-09-07"), value: 22, label: "Thu"),
                .init(date: date("2023-09-08"), value: 19, label: "Fri"),
                .init(date: date("2023-09-09"), value: 53, label: "Sat"),
                .init(date: date("2023-09-10"), value: 30, label: "Sun")
            ]
        case .week:
            [
                .init(date: date("2023-09-04"), value: 72, label: "04.09"),
                .init(date: date("2023-09-11"), value: 63, label: "11.09"),
                .init(date: date("2023-09-18"), value: 72, label: "18.09"),
                .init(date: date("2023-09-25"), value: 32, label: "25.09"),
                .init(date: date("2023-10-02"), value: 29, label: "02.10"),
                .init(date: date("2023-10-09"), value: 63, label: "09.10"),
                .init(date: date("2023-10-16"), value: 40, label: "16.10")
            ]
        case .month:
            [
                .init(date: date("2023-10-01"), value: 82, label: "Oct"),
                .init(date: date("2023-11-01"), value: 73, label: "Nov"),
                .init(date: date("2023-12-01"), value: 82, label: "Dec"),
                .init(date: date("2024-01-01"), value: 42, label: "Jan"),
                .init(date: date("2024-02-01"), value: 39, label: "Feb"),
                .init(date: date("2024-03-01"), value: 73, label: "Mar"),
                .init(date: date("2024-04-01"), value: 50, label: "Apr")
            ]
        }
    }

    static func vsrData(range: ChartRange) -> [HealthInfoDM] {
        switch range {
        case .day:
            [
                .init(date: date("2023-09-04"), value: 25, label: "Mon"),
                .init(date: date("2023-09-05"), value: 37, label: "Tue"),
                .init(date: date("2023-09-06"), value: 35, label: "Wed"),
                .init(date: date("2023-09-07"), value: 36, label: "Thu"),
                .init(date: date("2023-09-08"), value: 24, label: "Fri"),
                .init(date: date("2023-09-09"), value: 31, label: "Sat"),
                .init(date: date("2023-09-10"), value: 23, label: "Sun")
            ]
        case .week:
            [
                .init(date: date("2023-09-04"), value: 35, label: "04.09"),
                .init(date: date("2023-09-11"), value: 47, label: "11.09"),
                .init(date: date("2023-09-18"), value: 45, label: "18.09"),
                .init(date: date("2023-09-25"), value: 46, label: "25.09"),
                .init(date: date("2023-10-02"), value: 34, label: "02.10"),
                .init(date: date("2023-10-09"), value: 33, label: "09.10"),
                .init(date: date("2023-10-16"), value: 33, label: "16.10")
            ]
        case .month:
            [
                .init(date: date("2023-10-01"), value: 45, label: "Oct"),
                .init(date: date("2023-11-01"), value: 57, label: "Nov"),
                .init(date: date("2023-12-01"), value: 55, label: "Dec"),
                .init(date: date("2024-01-01"), value: 56, label: "Jan"),
                .init(date: date("2024-02-01"), value: 44, label: "Feb"),
                .init(date: date("2024-03-01"), value: 51, label: "Mar"),
                .init(date: date("2024-04-01"), value: 43, label: "Apr")
            ]
        }
    }
    
    static func pulseData(range: ChartRange) -> [HealthInfoDM] {
        switch range {
        case .day:
            [
                .init(date: date("2023-09-04"), value: 54, label: "Mon"),
                .init(date: date("2023-09-05"), value: 52, label: "Tue"),
                .init(date: date("2023-09-06"), value: 52, label: "Wed"),
                .init(date: date("2023-09-07"), value: 51, label: "Thu"),
                .init(date: date("2023-09-08"), value: 57, label: "Fri"),
                .init(date: date("2023-09-09"), value: 54, label: "Sat"),
                .init(date: date("2023-09-10"), value: 58, label: "Sun")
            ]
        case .week:
            [
                .init(date: date("2023-09-04"), value: 64, label: "04.09"),
                .init(date: date("2023-09-11"), value: 62, label: "11.09"),
                .init(date: date("2023-09-18"), value: 62, label: "18.09"),
                .init(date: date("2023-09-25"), value: 61, label: "25.09"),
                .init(date: date("2023-10-02"), value: 67, label: "02.10"),
                .init(date: date("2023-10-09"), value: 64, label: "09.10"),
                .init(date: date("2023-10-16"), value: 68, label: "16.10")
            ]
        case .month:
            [
                .init(date: date("2023-10-01"), value: 74, label: "Oct"),
                .init(date: date("2023-11-01"), value: 72, label: "Nov"),
                .init(date: date("2023-12-01"), value: 72, label: "Dec"),
                .init(date: date("2024-01-01"), value: 71, label: "Jan"),
                .init(date: date("2024-02-01"), value: 77, label: "Feb"),
                .init(date: date("2024-03-01"), value: 74, label: "Mar"),
                .init(date: date("2024-04-01"), value: 78, label: "Apr")
            ]
        }
    }
    
    static func breathData(range: ChartRange) -> [HealthInfoDM] {
        switch range {
        case .day:
            [
                .init(date: date("2023-09-04"), value: 13.2, label: "Mon"),
                .init(date: date("2023-09-05"), value: 12.9, label: "Tue"),
                .init(date: date("2023-09-06"), value: 13.1, label: "Wed"),
                .init(date: date("2023-09-07"), value: 12.8, label: "Thu"),
                .init(date: date("2023-09-08"), value: 13.2, label: "Fri"),
                .init(date: date("2023-09-09"), value: 12.8, label: "Sat"),
                .init(date: date("2023-09-10"), value: 13.0, label: "Sun")
            ]
        case .week:
            [
                .init(date: date("2023-09-04"), value: 14.0, label: "04.09"),
                .init(date: date("2023-09-11"), value: 13.9, label: "11.09"),
                .init(date: date("2023-09-18"), value: 14.1, label: "18.09"),
                .init(date: date("2023-09-25"), value: 13.8, label: "25.09"),
                .init(date: date("2023-10-02"), value: 14.0, label: "02.10"),
                .init(date: date("2023-10-09"), value: 13.9, label: "09.10"),
                .init(date: date("2023-10-16"), value: 14.0, label: "16.10")
            ]
        case .month:
            [
                .init(date: date("2023-10-01"), value: 15.2, label: "Mon"),
                .init(date: date("2023-11-01"), value: 14.9, label: "Tue"),
                .init(date: date("2023-12-01"), value: 15.1, label: "Wed"),
                .init(date: date("2024-01-01"), value: 14.8, label: "Thu"),
                .init(date: date("2024-02-01"), value: 15.2, label: "Fri"),
                .init(date: date("2024-03-01"), value: 14.8, label: "Sat"),
                .init(date: date("2024-04-01"), value: 15.0, label: "Sun")
            ]
        }
    }
    
    static func sleepData(range: ChartRange) -> [HealthInfoDM] {
        switch range {
        case .day:
            [
                .init(date: date("2023-09-04"), value: 38, label: "Mon"),
                .init(date: date("2023-09-05"), value: 74, label: "Tue"),
                .init(date: date("2023-09-06"), value: 54, label: "Wed"),
                .init(date: date("2023-09-07"), value: 69, label: "Thu"),
                .init(date: date("2023-09-08"), value: 67, label: "Fri"),
                .init(date: date("2023-09-09"), value: 70, label: "Sat"),
                .init(date: date("2023-09-10"), value: 71, label: "Sun")
            ]
        case .week:
            [
                .init(date: date("2023-09-04"), value: 48, label: "04.09"),
                .init(date: date("2023-09-11"), value: 84, label: "11.09"),
                .init(date: date("2023-09-18"), value: 64, label: "18.09"),
                .init(date: date("2023-09-25"), value: 79, label: "25.09"),
                .init(date: date("2023-10-02"), value: 77, label: "02.10"),
                .init(date: date("2023-10-09"), value: 80, label: "09.10"),
                .init(date: date("2023-10-16"), value: 81, label: "16.10")
            ]
        case .month:
            [
                .init(date: date("2023-10-01"), value: 58, label: "Oct"),
                .init(date: date("2023-11-01"), value: 94, label: "Nov"),
                .init(date: date("2023-12-01"), value: 74, label: "Dec"),
                .init(date: date("2024-01-01"), value: 89, label: "Jan"),
                .init(date: date("2024-02-01"), value: 87, label: "Feb"),
                .init(date: date("2024-03-01"), value: 90, label: "Mar"),
                .init(date: date("2024-04-01"), value: 91, label: "Apr")
            ]
        }
    }
    
    static func date(_ string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.date(from: string)!
    }
}

