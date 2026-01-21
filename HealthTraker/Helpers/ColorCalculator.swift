//
//  ColorCalculator.swift
//  HealthTraker
//
//  Created by Ali on 19/12/2025.
//

import UIKit
import SwiftUI

public enum CalculatedColor {
    case red
    case yellow
    case green
}

public protocol ColorCalculator {
    func color(for value: CGFloat) -> CalculatedColor
}

public struct DefaultColorCalculator: ColorCalculator {

    public init() {}

    public func color(for value: CGFloat) -> CalculatedColor {
        switch value {
        case ..<40:
            return .red
        case 30..<70:
            return .yellow
        default:
            return .green
        }
    }
}

public extension UIColor {

    static func calculated(
        for value: CGFloat
    ) -> UIColor {
        UIColor.from(DefaultColorCalculator().color(for: value))
    }

    static func from(_ calculatedColor: CalculatedColor) -> UIColor {
        switch calculatedColor {
        case .red: return ColorLibrary.red
        case .yellow: return ColorLibrary.yellow
        case .green: return ColorLibrary.darkGreen
        }
    }
}

public extension Color {

    static func calculated(
        for value: CGFloat
    ) -> Color {
        Color.from(DefaultColorCalculator().color(for: value))
    }

    static func from(_ calculatedColor: CalculatedColor) -> Color {
        switch calculatedColor {
        case .red: return ColorLibrary.red.color
        case .yellow: return ColorLibrary.yellow.color
        case .green: return ColorLibrary.darkGreen.color
        }
    }
}
