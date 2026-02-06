//
//  SleepResponseDTO.swift
//  HealthTraker
//
//  Created by User on 04/02/26.
//

import Foundation

// MARK: - Codable Models (API Response)
struct SleepResponseDTO: Codable {
    let data: SleepDataDTO
}

struct SleepDataDTO: Codable {
    let days: [SleepDayDTO]
    let graph: SleepGraphDTO
}

struct SleepGraphDTO: Codable {
    let daily: [SleepDayDTO]
    let weekly: [SleepDayDTO]
    let monthly: [SleepDayDTO]
}

struct SleepDayDTO: Codable {
    let date: TimeInterval
    let value: Int
    let avgValue: Int
    let sleepTimeInHours: Double
    let sleepTimeFormatted: String
    let avgSleepTimeInHours: Double
    let avgSleepTimeFormatted: String
    let sleepNeededInHours: Double
    let sleepNeededFormatted: String
    let avgSleepNeededInHours: Double
    let avgSleepNeededFormatted: String
    let periods: SleepPeriodsDTO
    let sleepPerformancePercentage: Double
    let sleepEfficiencyPercentage: Double
    let avgStartTime: Int
    let avgStartTimeFormatted: String
    let avgEndTime: Int
    let avgEndTimeFormatted: String
    let isCurrentDate: Bool
    
    enum CodingKeys: String, CodingKey {
        case date, value, periods
        case avgValue = "avg_value"
        case sleepTimeInHours = "sleep_time_in_hours"
        case sleepTimeFormatted = "sleep_time_formatted"
        case avgSleepTimeInHours = "avg_sleep_time_in_hours"
        case avgSleepTimeFormatted = "avg_sleep_time_formatted"
        case sleepNeededInHours = "sleep_needed_in_hours"
        case sleepNeededFormatted = "sleep_needed_formatted"
        case avgSleepNeededInHours = "avg_sleep_needed_in_hours"
        case avgSleepNeededFormatted = "avg_sleep_needed_formatted"
        case sleepPerformancePercentage = "sleep_performance_percentage"
        case sleepEfficiencyPercentage = "sleep_efficiency_percentage"
        case avgStartTime = "avg_start_time"
        case avgStartTimeFormatted = "avg_start_time_formatted"
        case avgEndTime = "avg_end_time"
        case avgEndTimeFormatted = "avg_end_time_formatted"
        case isCurrentDate = "is_current_date"
    }
}

struct SleepPeriodsDTO: Codable {
    let rem: SleepPeriodInfoDTO
    let light: SleepPeriodInfoDTO
    let deep: SleepPeriodInfoDTO
    let awake: SleepPeriodInfoDTO
}

struct SleepPeriodInfoDTO: Codable {
    let timeInMilli: Int
    let timeInHours: Double
    let timeFormatted: String
    let averageTimeInHours: Double
    let averageTimeFormatted: String
    let percentage: Double
    
    enum CodingKeys: String, CodingKey {
        case percentage
        case timeInMilli = "time_in_milli"
        case timeInHours = "time_in_hours"
        case timeFormatted = "time_formatted"
        case averageTimeInHours = "average_time_in_hours"
        case averageTimeFormatted = "average_time_formatted"
    }
}
