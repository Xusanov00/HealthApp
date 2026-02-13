//
//  SleepViewModel.swift
//  HealthTraker
//
//  Created by Ali on 20/12/2025.
//

import Foundation

class SleepViewModel {
    var selectedRange: ChartRange = .day
    var selectedDate: Date = Date()
    
    private let mockData = RecoveryMockData.shared
    private var graphData: RecoveryDataDM
    private let sleepMockData = SleepMockData.shared
    private var sleepGraphData: SleepDataDM
    
    init() {
        graphData = mockData.data
        sleepGraphData = sleepMockData.data
    }
    
    // MARK: - Public Data
    
    var calendarRecoveryData: [HealthInfoDM] {
        mapCalendarData()
    }
    
    var recoverySelectedData: HealthInfoDM? {
        mapCalendarData().first { Calendar.current.isDate($0.date, inSameDayAs: selectedDate) }
    }
    
    var recoveryData: [HealthInfoDM] {
        mapGraphData(keyPath: \.recoveryPercentage)
    }
    
    var pulseData: [HealthInfoDM] {
        mapGraphData(keyPath: \.restingHeartRate)
    }
    
    var vsrData: [HealthInfoDM] {
        mapGraphData(keyPath: \.hrvRmssdMilli)
    }
    
    var breathData: [HealthInfoDM] {
        mapGraphData(keyPath: \.spo2Percentage)
    }
    
    var sleepData: [HealthInfoDM] {
        mapGraphData(keyPath: \.sleepPerformancePercentage)
    }

    var sleepStageModel: SleepStageChartCardModel {
        SleepStageChartCardModel(days: sleepGraphDataForRange(), range: selectedRange)
    }
    
    // MARK: - Actions
    
    func dateChanged(date: Date) {
        selectedDate = date
    }
    
    func rangeChanged(range: ChartRange) {
        selectedRange = range
    }
    
    // MARK: - Private
    
    private func graphDataForRange() -> [RecoveryDayDM] {
        switch selectedRange {
        case .day:   return graphData.graph.daily
        case .week:  return graphData.graph.weekly
        case .month: return graphData.graph.monthly
        }
    }

    private func sleepGraphDataForRange() -> [SleepDayDM] {
        switch selectedRange {
        case .day:   return sleepGraphData.graph.daily
        case .week:  return sleepGraphData.graph.weekly
        case .month: return sleepGraphData.graph.monthly
        }
    }
    
    private func mapCalendarData() -> [HealthInfoDM] {
        graphData.days.map { data in
            HealthInfoDM(
                date: data.date.toDate,
                value: data.recoveryPercentage,
                label: data.date.dateString(for: selectedRange)
            )
        }
    }
    
    private func mapGraphData(keyPath: KeyPath<RecoveryDayDM, Double>) -> [HealthInfoDM] {
        graphDataForRange().map { data in
            HealthInfoDM(
                date: data.date.toDate,
                value: data[keyPath: keyPath],
                label: data.date.dateString(for: selectedRange)
            )
        }
    }
}
