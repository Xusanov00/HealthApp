//
//  RecoveryViewModel.swift
//  HealthTraker
//
//  Created by Ali on 20/12/2025.
//

enum ChartRange {
    case day
    case week
    case month
}

class RecoveryViewModel {
    var recoveryData: [HealthInfoDM] = Mocks().recoveryData
    var pulseData: [HealthInfoDM] = Mocks().vsrData
    var vsrData: [HealthInfoDM] = Mocks().pulseData
    var breathData: [HealthInfoDM] = Mocks().breathData
    var sleepData: [HealthInfoDM] = Mocks().sleepData
}
