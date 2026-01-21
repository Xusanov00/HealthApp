//
//  BarType.swift
//  HealthTraker
//
//  Created by User on 16/01/26.
//

import SwiftUI

final class LineChartViewModel: ObservableObject {
    // MARK: - Setters
    @Published var animatedData: [ChartAnimatedDM] = []
    @Published var markedLineValue: Double = 0
    @Published var isPercentage = false
    @Published var data: [HealthInfoDM] = [] {
        didSet {
            setData(data)
        }
    }
    @Published var showPointValues: Bool = false
    @Published var lineColor: Color = ColorLibrary.green.color
    @Published var yValues: [Double] = [] {
        didSet {
            recalculateYRange()
        }
    }
    
    // MARK: - Getters
    private var yRange: ClosedRange<Double> = 0...1
    
}

// MARK: - Getter funcs
extension LineChartViewModel {
    func getChartYRange() -> ClosedRange<Double> {
        yRange
    }
    private func recalculateYRange() {
        guard
            let min = yValues.min(),
            let max = yValues.max()
        else {
            yRange = 0...1
            return
        }

        yRange = min...max
    }
}

// MARK: - Padding from left and right of Lines
extension LineChartViewModel {
    var xDomain: ClosedRange<Date> {
        guard
            let first = data.first?.date,
            let last  = data.last?.date
        else {
            let now = Date()
            return now...now
        }

        let step = data[1].date.timeIntervalSince(data[0].date)
        let padding: TimeInterval = step * 0.5

        return first.addingTimeInterval(-padding)
            ...
            last.addingTimeInterval(padding)
    }
}

// MARK: - Chart mapper
extension LineChartViewModel {
    func setData(_ source: [HealthInfoDM]) {
        let items = source.map {
            ChartAnimatedDM(
                id: $0.id,
                date: $0.date,
                label: $0.label,
                value: $0.value,
                animatedValue: $0.value * 0.6
            )
        }

        withAnimation(.none) {
            animatedData = items
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) {
            withAnimation(.easeOut(duration: 0.2)) {
                self.animatedData = items.map {
                    var item = $0
                    item.animatedValue = item.value
                    return item
                }
            }
        }
    }
}

// MARK: - Chart Y axis value configuration
extension LineChartViewModel {
    func formattedValue(_ value: Double) -> String {
        let formatted = value.formatted(
            .number.precision(.fractionLength(0...1))
        )
        
        return isPercentage
        ? "\(formatted)%"
        : formatted
    }
    
    func isMarkedValue(_ value: Double) -> Bool {
        guard
            value != 0
        else {
            return false
        }
        return abs(value - markedLineValue) < 0.0001
    }
}
