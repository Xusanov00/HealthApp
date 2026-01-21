//
//  ViewController.swift
//  HealthTraker
//
//  Created by Ali on 10/12/2025.
//

import UIKit

class ActivityVC: UIViewController, RootViewProviding {
    typealias RootView = ActivityRootView
    private lazy var dataProvider: ActivityDataProvider = {
        let provider = ActivityDataProvider(collectionView: rootView.collectionView)
        return provider
    }()
    
    private var viewModel = RecoveryViewModel()

    override func loadView() {
        view = ActivityRootView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
    }
}

// MARK: - Appearance
extension ActivityVC {
    private func appearanceSettings() {
        dataProvider.delegate = self
        dataProvider.recoveryData = viewModel.recoveryData
    }
}

// MARK: - ActivityDataProviderDelegate
extension ActivityVC: ActivityDataProviderDelegate {
    func recoveryTapped() {
        let recoveryVC = RecoveryVC()
        recoveryVC.modalPresentationStyle = .fullScreen
        present(recoveryVC, animated: true)
    }
}
