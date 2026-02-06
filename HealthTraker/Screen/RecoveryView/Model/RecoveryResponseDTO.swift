//
//  RecoveryResponseDTO.swift
//  HealthTraker
//
//  Created by User on 05/02/26.
//

import Foundation

// MARK: - Recovery Codable Models (API Response)
struct RecoveryResponseDTO: Codable {
    let data: RecoveryDataDTO
}

struct RecoveryDataDTO: Codable {
    let days: [RecoveryDayDTO]
    let graph: RecoveryGraphDTO
}

struct RecoveryGraphDTO: Codable {
    let daily: [RecoveryDayDTO]
    let weekly: [RecoveryDayDTO]
    let monthly: [RecoveryDayDTO]
}

struct RecoveryDayDTO: Codable {
    let date: TimeInterval
    let value: Double
    let avgValue: Double
    let recoveryPercentage: Double
    let restingHeartRate: Double
    let hrvRmssdMilli: Double
    let spo2Percentage: Double
    let skinTempCelsius: Double
    let sleepPerformancePercentage: Double
    let sleepConsistencyPercentage: Double
    let sleepEfficiencyPercentage: Double
    let isCurrentDate: Bool
    
    enum CodingKeys: String, CodingKey {
        case date, value
        case avgValue = "avg_value"
        case recoveryPercentage = "recovery_percentage"
        case restingHeartRate = "resting_heart_rate"
        case hrvRmssdMilli = "hrv_rmssd_milli"
        case spo2Percentage = "spo2_percentage"
        case skinTempCelsius = "skin_temp_celsius"
        case sleepPerformancePercentage = "sleep_performance_percentage"
        case sleepConsistencyPercentage = "sleep_consistency_percentage"
        case sleepEfficiencyPercentage = "sleep_efficiency_percentage"
        case isCurrentDate = "is_current_date"
    }
}
