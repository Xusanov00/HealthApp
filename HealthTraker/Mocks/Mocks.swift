//
//  Mocks.swift
//  HealthTraker
//
//  Created by Ali on 18/12/2025.
//

import Foundation

struct Mocks {
    let mockLast12Months: [HealthInfoDM] = [
        .init(date: Date.from(year: 2024, month: 10, day: 1), value: 0),
        .init(date: Date.from(year: 2024, month: 11, day: 1), value: 0),
        .init(date: Date.from(year: 2024, month: 12, day: 1), value: 0),
        .init(date: Date.from(year: 2025, month: 1,  day: 1), value: 0),
        .init(date: Date.from(year: 2025, month: 2,  day: 1), value: 0),
        .init(date: Date.from(year: 2025, month: 3,  day: 1), value: 0),
        .init(date: Date.from(year: 2025, month: 4,  day: 1), value: 0),
        .init(date: Date.from(year: 2025, month: 5,  day: 1), value: 0),
        .init(date: Date.from(year: 2025, month: 6,  day: 1), value: 0),
        .init(date: Date.from(year: 2025, month: 7,  day: 1), value: 0),
        
        // последние 2 месяца с данными
        .init(date: Date.from(year: 2025, month: 8,  day: 1), value: 56),
        .init(date: Date.from(year: 2025, month: 9,  day: 1), value: 82)
    ]
    
    let recoveryData: [HealthInfoDM] = [
        .init(date: .now.addingTimeInterval(-6*86400), value: 69),
        .init(date: .now.addingTimeInterval(-5*86400), value: 54),
        .init(date: .now.addingTimeInterval(-4*86400), value: 69),
        .init(date: .now.addingTimeInterval(-3*86400), value: 33),
        .init(date: .now.addingTimeInterval(-2*86400), value: 26),
        .init(date: .now.addingTimeInterval(-1*86400), value: 54),
        .init(date: .now, value: 36),
    ]
    
    let vsrData: [HealthInfoDM] = [
        .init(date: .now.addingTimeInterval(-6*86400), value: 35),
        .init(date: .now.addingTimeInterval(-5*86400), value: 47),
        .init(date: .now.addingTimeInterval(-4*86400), value: 45),
        .init(date: .now.addingTimeInterval(-3*86400), value: 46),
        .init(date: .now.addingTimeInterval(-2*86400), value: 34),
        .init(date: .now.addingTimeInterval(-1*86400), value: 41),
        .init(date: .now, value: 33),
    ]
    
    let pulseData: [HealthInfoDM] = [
        .init(date: .now.addingTimeInterval(-6*86400), value: 64),
        .init(date: .now.addingTimeInterval(-5*86400), value: 62),
        .init(date: .now.addingTimeInterval(-4*86400), value: 62),
        .init(date: .now.addingTimeInterval(-3*86400), value: 61),
        .init(date: .now.addingTimeInterval(-2*86400), value: 67),
        .init(date: .now.addingTimeInterval(-1*86400), value: 64),
        .init(date: .now, value: 68),
    ]
    
    let breathData: [HealthInfoDM] = [
        .init(date: .now.addingTimeInterval(-6*86400), value: 14.2),
        .init(date: .now.addingTimeInterval(-5*86400), value: 13.9),
        .init(date: .now.addingTimeInterval(-4*86400), value: 14.1),
        .init(date: .now.addingTimeInterval(-3*86400), value: 13.8),
        .init(date: .now.addingTimeInterval(-2*86400), value: 14.2),
        .init(date: .now.addingTimeInterval(-1*86400), value: 13.8),
        .init(date: .now, value: 14.0),
    ]
    
    let sleepData: [HealthInfoDM] = [
        .init(date: .now.addingTimeInterval(-6*86400), value: 48),
        .init(date: .now.addingTimeInterval(-5*86400), value: 84),
        .init(date: .now.addingTimeInterval(-4*86400), value: 64),
        .init(date: .now.addingTimeInterval(-3*86400), value: 79),
        .init(date: .now.addingTimeInterval(-2*86400), value: 77),
        .init(date: .now.addingTimeInterval(-1*86400), value: 80),
        .init(date: .now, value: 81),
    ]
}
