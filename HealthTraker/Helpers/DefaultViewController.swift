//
//  DefaultViewController.swift
//  HealthTraker
//
//  Created by Ali on 11/12/2025.
//

import UIKit

protocol RootViewProviding: AnyObject {
    associatedtype RootView: UIView
}

extension RootViewProviding where Self: UIViewController {

    var rootView: RootView {
        guard let view = view as? RootView else {
            fatalError("Expected view of type \(RootView.self)")
        }
        return view
    }
}
