//
//  ActivityDM.swift
//  HealthTraker
//
//  Created by Ali on 11/12/2025.
//

import Foundation

struct HealthInfoDM: Identifiable {
    let id = UUID()
    let date: Date
    let value: Double
}

struct LineSegment: Identifiable {
    let id = UUID()
    let start: HealthInfoDM
    let end: HealthInfoDM
}
