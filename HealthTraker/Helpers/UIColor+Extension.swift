//
//  UIColor+Extension.swift
//  HealthTraker
//
//  Created by Habibulloh on 08/01/26.
//

import UIKit
import SwiftUI

extension UIColor {
	var color: Color { Color(self) }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let hex = hex
            .trimmingCharacters(in: CharacterSet.alphanumerics.inverted)

        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let r = CGFloat((int >> 16) & 0xFF) / 255
        let g = CGFloat((int >> 8) & 0xFF) / 255
        let b = CGFloat(int & 0xFF) / 255

        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}
