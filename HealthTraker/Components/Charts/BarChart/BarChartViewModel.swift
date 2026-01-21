//
//  BarChartViewModel.swift
//  HealthTraker
//
//  Created by User on 16/01/26.
//

import SwiftUI

extension BarChartViewModel {
    enum BarType {
        case mono
        case colorful
    }
}

final class BarChartViewModel: ObservableObject {
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
    @Published var yValues: [Double] = [] {
        didSet {
            recalculateYRange()
        }
    }
    
    // MARK: - Getters
    var barType: BarType = .mono
    var barWidth: CGFloat {
        barType == .mono ? 10 : 15
    }
    private var yRange: ClosedRange<Double> = 0...1
}

// MARK: - Getter funcs
extension BarChartViewModel {
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

// MARK: - Padding from left and right of Bars
extension BarChartViewModel {
    var xDomain: ClosedRange<Date> {
        guard
            let first = data.first?.date,
            let last  = data.last?.date
        else {
            let now = Date()
            return now...now
        }

        let step = data[1].date.timeIntervalSince(data[0].date)
        let padding: TimeInterval = step * 0.3

        return first.addingTimeInterval(-padding)
            ...
            last.addingTimeInterval(padding)
    }
}

// MARK: - Chart mapper for animated model
extension BarChartViewModel {
    func setData(_ source: [HealthInfoDM]) {
        let items = source.map {
            ChartAnimatedDM(
                id: $0.id,
                date: $0.date,
                label: $0.label,
                value: $0.value,
                animatedValue: 0
            )
        }
        
        self.animatedData = items
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) {
            withAnimation(.easeOut(duration: 0.6)) {
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
extension BarChartViewModel {
    func isMarkedValue(_ value: Double) -> Bool {
        guard
            value != 0
        else {
            return false
        }
        return value == markedLineValue
    }
}
