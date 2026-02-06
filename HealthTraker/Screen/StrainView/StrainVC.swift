//
//  StrainViewController.swift
//  HealthTraker
//
//  Created by User on 04/02/26.
//

import UIKit

class StrainVC: UIViewController, RootViewProviding {
    typealias RootView = StrainRootView
    
    override func loadView() {
        super.loadView()
        view = StrainRootView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.delegate = self
    }
}


// MARK: - StrainRootViewDelegate
extension StrainVC: StrainRootViewDelegate {
    func dismissTapped() {
        self.dismiss(animated: true)
    }
}
