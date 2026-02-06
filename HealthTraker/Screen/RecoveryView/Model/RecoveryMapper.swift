//
//  RecoveryMapper.swift
//  HealthTraker
//
//  Created by User on 05/02/26.
//


// MARK: - Recovery Mapper

struct RecoveryMapper {
    
    static func map(response: RecoveryResponseDTO) -> RecoveryDataDM {
        return RecoveryDataDM(
            days: response.data.days.map { mapDay($0) },
            graph: mapGraph(response.data.graph)
        )
    }
    
    static func mapGraph(_ dto: RecoveryGraphDTO) -> RecoveryGraphDM {
        return RecoveryGraphDM(
            daily: dto.daily.map { mapDay($0) },
            weekly: dto.weekly.map { mapDay($0) },
            monthly: dto.monthly.map { mapDay($0) }
        )
    }
    
    static func mapDay(_ dto: RecoveryDayDTO) -> RecoveryDayDM {
        return RecoveryDayDM(
            date: dto.date,
            value: dto.value,
            avgValue: dto.avgValue,
            recoveryPercentage: dto.recoveryPercentage,
            restingHeartRate: dto.restingHeartRate,
            hrvRmssdMilli: dto.hrvRmssdMilli,
            spo2Percentage: dto.spo2Percentage,
            skinTempCelsius: dto.skinTempCelsius,
            sleepPerformancePercentage: dto.sleepPerformancePercentage,
            sleepConsistencyPercentage: dto.sleepConsistencyPercentage,
            sleepEfficiencyPercentage: dto.sleepEfficiencyPercentage,
            isCurrentDate: dto.isCurrentDate
        )
    }
}