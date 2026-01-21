//
//  ValueCalculator.swift
//  HealthTraker
//
//  Created by User on 20/01/26.
//

import Foundation

public extension Double {
    func valueFormatter(inPercent: Bool = false) -> String {
        let formatted = self.formatted(
            .number.precision(.fractionLength(0...1))
        )
        
        return inPercent
            ? "\(formatted)%"
            : formatted
    }
}
