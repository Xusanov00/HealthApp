//
//  SleepStagesInfoController.swift
//  HealthTraker
//
//  Created by User on 12/02/26.
//

import UIKit

class SleepStagesInfoController: UIViewController, RootViewProviding {
    typealias RootView = SleepStagesInfoRootView
    
    override func loadView() {
        view = RootView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
