//
//  ReusableCell+Extension.swift
//  HealthTraker
//
//  Created by Ali on 20/12/2025.
//

import UIKit

protocol ReusableCell {
    static var string: String { get }
}

extension ReusableCell {
    static var string: String {
        String(describing: Self.self)
    }
}

extension UICollectionViewCell: ReusableCell {}
extension UITableViewCell: ReusableCell {}
