//
//  RecoveryDataDM.swift
//  HealthTraker
//
//  Created by User on 05/02/26.
//

import Foundation

// MARK: - Recovery Domain Models (UI)
struct RecoveryDataDM {
    /// Массив дней (21 элемент) - [RecoveryDayDM, ...]
    let days: [RecoveryDayDM]
    /// Данные для графиков - RecoveryGraphDM
    let graph: RecoveryGraphDM
}

struct RecoveryGraphDM {
    /// Дневной график (7 элементов) - [RecoveryDayDM, ...]
    let daily: [RecoveryDayDM]
    /// Недельный график (7 элементов) - [RecoveryDayDM, ...]
    let weekly: [RecoveryDayDM]
    /// Месячный график (7 элементов) - [RecoveryDayDM, ...]
    let monthly: [RecoveryDayDM]
}

struct RecoveryDayDM {
    /// Unix timestamp - 1769299199
    let date: TimeInterval
    /// Значение восстановления - 23.0
    let value: Double
    /// Среднее значение - 23.0
    let avgValue: Double
    /// Процент восстановления - 23.0
    let recoveryPercentage: Double
    /// Пульс в покое (уд/мин) - 76.0
    let restingHeartRate: Double
    /// HRV RMSSD (мс) - 29.73
    let hrvRmssdMilli: Double
    /// Насыщение кислородом (%) - 92.71
    let spo2Percentage: Double
    /// Температура кожи (°C) - 33.63
    let skinTempCelsius: Double
    /// Производительность сна (%) - 69.0
    let sleepPerformancePercentage: Double
    /// Постоянство сна (%) - 0.0
    let sleepConsistencyPercentage: Double
    /// Эффективность сна (%) - 93.31
    let sleepEfficiencyPercentage: Double
    /// Флаг текущего дня - true/false
    let isCurrentDate: Bool
}
