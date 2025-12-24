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
    
    private var viewModel = ActivityViewModel()

    override func loadView() {
        view = ActivityRootView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
    }
    
}

extension ActivityVC {
    private func appearanceSettings() { }
}
