//
//  SleepMapper.swift
//  HealthTraker
//
//  Created by User on 04/02/26.
//


// MARK: - Sleep Mapper

struct SleepMapper {
    
    static func map(response: SleepResponseDTO) -> SleepDataDM {
        return SleepDataDM(
            days: response.data.days.map { mapDay($0) },
            graph: mapGraph(response.data.graph)
        )
    }
    
    static func mapGraph(_ dto: SleepGraphDTO) -> SleepGraphDM {
        return SleepGraphDM(
            daily: dto.daily.map { mapDay($0) },
            weekly: dto.weekly.map { mapDay($0) },
            monthly: dto.monthly.map { mapDay($0) }
        )
    }
    
    static func mapDay(_ dto: SleepDayDTO) -> SleepDayDM {
        return SleepDayDM(
            date: dto.date,
            value: dto.value,
            avgValue: dto.avgValue,
            sleepTimeInHours: dto.sleepTimeInHours,
            sleepTimeFormatted: dto.sleepTimeFormatted,
            avgSleepTimeInHours: dto.avgSleepTimeInHours,
            avgSleepTimeFormatted: dto.avgSleepTimeFormatted,
            sleepNeededInHours: dto.sleepNeededInHours,
            sleepNeededFormatted: dto.sleepNeededFormatted,
            avgSleepNeededInHours: dto.avgSleepNeededInHours,
            avgSleepNeededFormatted: dto.avgSleepNeededFormatted,
            periods: mapPeriods(dto.periods),
            sleepPerformancePercentage: dto.sleepPerformancePercentage,
            sleepEfficiencyPercentage: dto.sleepEfficiencyPercentage,
            avgStartTime: dto.avgStartTime,
            avgStartTimeFormatted: dto.avgStartTimeFormatted,
            avgEndTime: dto.avgEndTime,
            avgEndTimeFormatted: dto.avgEndTimeFormatted,
            isCurrentDate: dto.isCurrentDate
        )
    }
    
    static func mapPeriods(_ dto: SleepPeriodsDTO) -> SleepPeriodsDM {
        return SleepPeriodsDM(
            rem: mapPeriodInfo(dto.rem),
            light: mapPeriodInfo(dto.light),
            deep: mapPeriodInfo(dto.deep),
            awake: mapPeriodInfo(dto.awake)
        )
    }
    
    static func mapPeriodInfo(_ dto: SleepPeriodInfoDTO) -> SleepPeriodInfoDM {
        return SleepPeriodInfoDM(
            timeInMilli: dto.timeInMilli,
            timeInHours: dto.timeInHours,
            timeFormatted: dto.timeFormatted,
            averageTimeInHours: dto.averageTimeInHours,
            averageTimeFormatted: dto.averageTimeFormatted,
            percentage: dto.percentage
        )
    }
}