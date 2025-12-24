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
        case ..<30:
            return .red
        case 30..<60:
            return .yellow
        default:
            return .green
        }
    }
}

public extension UIColor {

    static func calculated(
        for value: CGFloat,
        using calculator: ColorCalculator = DefaultColorCalculator()
    ) -> UIColor {
        UIColor.from(calculator.color(for: value))
    }

    static func from(_ calculatedColor: CalculatedColor) -> UIColor {
        switch calculatedColor {
        case .red: return .systemRed
        case .yellow: return .systemYellow
        case .green: return .systemGreen
        }
    }
}

public extension Color {

    static func calculated(
        for value: CGFloat,
        using calculator: ColorCalculator = DefaultColorCalculator()
    ) -> Color {
        Color.from(calculator.color(for: value))
    }

    static func from(_ calculatedColor: CalculatedColor) -> Color {
        switch calculatedColor {
        case .red: return .red
        case .yellow: return .yellow
        case .green: return .green
        }
    }
}
