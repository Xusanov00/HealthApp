//
//  RecoveryViewModel.swift
//  HealthTraker
//
//  Created by Ali on 20/12/2025.
//

import Foundation

enum ChartRange {
    case day
    case week
    case month
}

class RecoveryViewModel {
    var selectedRange: ChartRange = .day
    var calendarRecoveryData: [HealthInfoDM] = Mocks.recoveryData(range: .day)
    var recoverySelectedData: HealthInfoDM? = Mocks.recoveryData(range: .day).last
    var recoveryData: [HealthInfoDM] = Mocks.recoveryData(range: .day)
    var vsrData: [HealthInfoDM] = Mocks.vsrData(range: .day)
    var pulseData: [HealthInfoDM] = Mocks.pulseData(range: .day)
    var breathData: [HealthInfoDM] = Mocks.breathData(range: .day)
    var sleepData: [HealthInfoDM] = Mocks.sleepData(range: .day)
    
    func dateChanged(date: Date) {
        recoverySelectedData = Mocks.recoveryData(
            range: .day
        ).filter { date == $0.date }.first
    }
    
    func rangeChanged(range: ChartRange) {
        selectedRange = range
        recoveryData = Mocks.recoveryData(range: selectedRange)
        pulseData = Mocks.pulseData(range: selectedRange)
        vsrData = Mocks.vsrData(range: selectedRange)
        breathData = Mocks.breathData(range: selectedRange)
        sleepData = Mocks.sleepData(range: selectedRange)
    }
}
