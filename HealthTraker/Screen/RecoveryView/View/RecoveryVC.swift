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

    private var viewModel = RecoveryViewModel()
    
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
        self.dataProvider.recoveryData = viewModel.recoveryData
        self.dataProvider.pulseData = viewModel.pulseData
        self.dataProvider.vsrData = viewModel.vsrData
        self.dataProvider.breathData = viewModel.breathData
        self.dataProvider.sleepData = viewModel.sleepData
    }
}

