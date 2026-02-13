//
//  SleepVC.swift
//  HealthTraker
//
//  Created by Ali on 21/12/2025.
//


import UIKit

class SleepVC: UIViewController, RootViewProviding {
    
    typealias RootView = SleepRootView
    private lazy var dataProvider = SleepDataProvider(
        tableView: rootView.tableView
    )
    
    private let viewModel = SleepViewModel()
    
    override func loadView() {
        view = SleepRootView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
    }
}

extension SleepVC {
    private func appearanceSettings() {
        rootView.delegate = self
        dataProvider.delegate = self
        dataProvider.calendarSleepData = viewModel.calendarRecoveryData
        dataProvider.sleepData = viewModel.sleepData
        dataProvider.sleepStageModel = viewModel.sleepStageModel
        dataProvider.selectedRange = viewModel.selectedRange
        
        dataProvider.selectedDate = viewModel.selectedDate
        dataProvider.sleepSelectedData = viewModel.recoverySelectedData
    }
}

// MARK: - SleepDataProviderDelegate
extension SleepVC: SleepDataProviderDelegate {
    func dateChanged(date: Date) {
        viewModel.dateChanged(date: date)
        dataProvider.selectedDate = viewModel.selectedDate
        dataProvider.sleepSelectedData = viewModel.recoverySelectedData
    }
    
    func rangeChanged(range: ChartRange) {
        viewModel.rangeChanged(range: range)
        dataProvider.sleepData = viewModel.sleepData
        dataProvider.sleepStageModel = viewModel.sleepStageModel
        dataProvider.selectedRange = viewModel.selectedRange
    }
}

// MARK: - SleepRootViewDelegate
extension SleepVC: SleepRootViewDelegate {
    func dismissTapped() {
        self.dismiss(animated: true)
    }
}

extension SleepVC: SleepStageChartTableViewCellDelegate {
    func sleepStageInfoTapped() {
        let vc = SleepStagesInfoController()
        self.present(vc, animated: true)
    }
}
