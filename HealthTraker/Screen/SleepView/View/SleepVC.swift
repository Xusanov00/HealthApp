//
//  SleepVC.swift
//  HealthTraker
//
//  Created by Ali on 21/12/2025.
//


import UIKit

class SleepVC: UIViewController, RootViewProviding {
    typealias RootView = SleepRootView
    
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
    }
}

// MARK: - SleepRootViewDelegate
extension SleepVC: SleepRootViewDelegate {
    func dismissTapped() {
        self.dismiss(animated: true)
    }
}
