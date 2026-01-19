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
    lazy var recoverySelectedData: HealthInfoDM? = Mocks.recoveryData(range: .day).last
    lazy var recoveryData: [HealthInfoDM] = Mocks.recoveryData(range: selectedRange)
    lazy var vsrData: [HealthInfoDM] = Mocks.vsrData(range: selectedRange)
    lazy var pulseData: [HealthInfoDM] = Mocks.pulseData(range: selectedRange)
    lazy var breathData: [HealthInfoDM] = Mocks.breathData(range: selectedRange)
    lazy var sleepData: [HealthInfoDM] = Mocks.sleepData(range: selectedRange)
    
    func dateChanged(date: Date) {
        recoverySelectedData = Mocks.recoveryData(
            range: selectedRange
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
