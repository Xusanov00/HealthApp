//
//  RecoveryVC.swift
//  HealthTraker
//
//  Created by Ali on 21/12/2025.
//


import UIKit

class RecoveryVC: UIViewController, RootViewProviding {
    
    typealias RootView = RecoveryRootView
    private lazy var dataProvider: RecoveryDataProvider = {
        let provider = RecoveryDataProvider(tableView: rootView.tableView)
        return provider
    }()

    private let viewModel = RecoveryViewModel()
    
    override func loadView() {
        view = RecoveryRootView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
    }
    
}

extension RecoveryVC {
    private func appearanceSettings() {
        rootView.delegate = self
        dataProvider.delegate = self
        dataProvider.calendarRecoveryData = viewModel.calendarRecoveryData
        dataProvider.recoveryData = viewModel.recoveryData
        dataProvider.pulseData = viewModel.pulseData
        dataProvider.vsrData = viewModel.vsrData
        dataProvider.breathData = viewModel.breathData
        dataProvider.sleepData = viewModel.sleepData
        dataProvider.recoverySelectedData = viewModel.recoverySelectedData
        dataProvider.selectedRange = viewModel.selectedRange
    }
}

// MARK: - RecoveryDataProviderDelegate
extension RecoveryVC: RecoveryDataProviderDelegate {
    func dateChanged(date: Date) {
        viewModel.dateChanged(date: date)
        dataProvider.recoverySelectedData = viewModel.recoverySelectedData
    }
    
    func rangeChanged(range: ChartRange) {
        viewModel.rangeChanged(range: range)
        dataProvider.recoveryData = viewModel.recoveryData
        dataProvider.pulseData = viewModel.pulseData
        dataProvider.vsrData = viewModel.vsrData
        dataProvider.breathData = viewModel.breathData
        dataProvider.sleepData = viewModel.sleepData
        dataProvider.selectedRange = viewModel.selectedRange
        print(viewModel.vsrData.first?.value, "vc")
    }
}

// MARK: - RecoveryRootViewDelegate
extension RecoveryVC: RecoveryRootViewDelegate {
    func dismissTapped() {
        self.dismiss(animated: true)
    }
}
