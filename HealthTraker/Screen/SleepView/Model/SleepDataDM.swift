//
//  SleepDataDM.swift
//  HealthTraker
//
//  Created by User on 04/02/26.
//

import Foundation

// MARK: - Domain Models (UI)
struct SleepDataDM {
    /// Массив дней (21 элемент) - [SleepDayDM, ...]
    let days: [SleepDayDM]
    /// Данные для графиков - SleepGraphDM
    let graph: SleepGraphDM
}

struct SleepGraphDM {
    /// Дневной график (7 элементов) - [SleepDayDM, ...]
    let daily: [SleepDayDM]
    /// Недельный график (7 элементов) - [SleepDayDM, ...]
    let weekly: [SleepDayDM]
    /// Месячный график (7 элементов) - [SleepDayDM, ...]
    let monthly: [SleepDayDM]
}

struct SleepDayDM {
    /// Unix timestamp - 1769299199
    let date: TimeInterval
    /// Значение в миллисекундах - 21779840
    let value: Int
    /// Среднее значение - 0
    let avgValue: Int
    /// Время сна в часах - 6.05
    let sleepTimeInHours: Double
    /// Форматированное время сна - "06:03"
    let sleepTimeFormatted: String
    /// Среднее время сна в часах - 6.05
    let avgSleepTimeInHours: Double
    /// Форматированное среднее время сна - "06:03"
    let avgSleepTimeFormatted: String
    /// Необходимое время сна в часах - 7.53
    let sleepNeededInHours: Double
    /// Форматированное необходимое время сна - "07:32"
    let sleepNeededFormatted: String
    /// Среднее необходимое время сна в часах - 7.53
    let avgSleepNeededInHours: Double
    /// Форматированное среднее необходимое время сна - "07:32"
    let avgSleepNeededFormatted: String
    /// Периоды сна (rem, light, deep, awake) - SleepPeriodsDM
    let periods: SleepPeriodsDM
    /// Процент производительности сна - 69.0
    let sleepPerformancePercentage: Double
    /// Процент эффективности сна - 93.31
    let sleepEfficiencyPercentage: Double
    /// Среднее время начала сна (секунды от полуночи) - 79879
    let avgStartTime: Int
    /// Форматированное среднее время начала сна - "22:11"
    let avgStartTimeFormatted: String
    /// Среднее время окончания сна (секунды от полуночи) - 16820
    let avgEndTime: Int
    /// Форматированное среднее время окончания сна - "04:40"
    let avgEndTimeFormatted: String
    /// Флаг текущего дня - true/false
    let isCurrentDate: Bool
}

struct SleepPeriodsDM {
    /// Фаза REM сна - SleepPeriodInfoDM
    let rem: SleepPeriodInfoDM
    /// Фаза легкого сна - SleepPeriodInfoDM
    let light: SleepPeriodInfoDM
    /// Фаза глубокого сна - SleepPeriodInfoDM
    let deep: SleepPeriodInfoDM
    /// Фаза бодрствования - SleepPeriodInfoDM
    let awake: SleepPeriodInfoDM
}

struct SleepPeriodInfoDM {
    /// Время в миллисекундах - 4623210
    let timeInMilli: Int
    /// Время в часах - 1.28
    let timeInHours: Double
    /// Форматированное время - "01:17"
    let timeFormatted: String
    /// Среднее время в часах - 1.28
    let averageTimeInHours: Double
    /// Форматированное среднее время - "01:17"
    let averageTimeFormatted: String
    /// Процент от общего времени сна - 19.807
    let percentage: Double
}
