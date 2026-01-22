//
//  HealthInfoDM.swift
//  HealthTraker
//
//  Created by Ali on 11/12/2025.
//

import Foundation

struct HealthInfoDM: Identifiable {
    let id = UUID()
    let date: Date
    let value: Double
    let label: String
}

extension HealthInfoDM {
    var isToday: Bool {
        Calendar.current.isDateInToday(date)
    }
}

struct ChartAnimatedDM: Identifiable, Equatable {
    let id: UUID
    let date: Date
    let label: String
    let value: Double

    var animatedValue: Double = 0
}
