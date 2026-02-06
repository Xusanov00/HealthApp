//
//  LineChartViewModel.swift
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
            calculateYAxisValues()
        }
    }
    @Published var showPointValues: Bool = false
    @Published var lineColor: Color = ColorLibrary.lightGreen.color
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

// MARK: - Auto Y Axis Calculation
extension LineChartViewModel {
    
    private func calculateYAxisValues() {
        // Только ненулевые значения для расчёта границ Y
        let values = data.map { $0.value }.filter { $0 > 0 }
        
        guard !values.isEmpty else {
            yValues = [0, 25, 50, 75, 100]
            return
        }
        
        let dataMin = values.min() ?? 0
        let dataMax = values.max() ?? 100
        
        // Вычисляем красивый шаг
        let range = dataMax - dataMin
        let rawStep = max(range / 4.0, 1)
        let niceStep = niceNumber(rawStep)
        
        // Границы с гарантированным отступом
        let niceMin = floor(dataMin / niceStep) * niceStep - niceStep
        let niceMax = ceil(dataMax / niceStep) * niceStep + niceStep
        
        // Не уходим в минус
        let finalMin = max(0, niceMin)
        
        // Генерируем значения
        var result: [Double] = []
        var current = finalMin
        while current <= niceMax + 0.001 {
            result.append(current)
            current += niceStep
        }
        
        // Ограничиваем количество делений (5-7)
        if result.count > 7 {
            result = reduceLabels(result, targetCount: 5)
        }
        
        yValues = result
    }
    
    private func niceNumber(_ value: Double) -> Double {
        guard value > 0 else { return 1 }
        
        let exponent = floor(log10(value))
        let fraction = value / pow(10, exponent)
        
        let niceFraction: Double
        if fraction <= 1.5 {
            niceFraction = 1
        } else if fraction <= 3 {
            niceFraction = 2
        } else if fraction <= 7 {
            niceFraction = 5
        } else {
            niceFraction = 10
        }
        
        return niceFraction * pow(10, exponent)
    }
    
    private func reduceLabels(_ labels: [Double], targetCount: Int) -> [Double] {
        guard labels.count > targetCount else { return labels }
        
        var result: [Double] = []
        let step = Double(labels.count - 1) / Double(targetCount - 1)
        
        for i in 0..<targetCount {
            let index = Int(round(Double(i) * step))
            if index < labels.count {
                result.append(labels[index])
            }
        }
        
        return result
    }
}

// MARK: - X Domain (все данные для оси X)
extension LineChartViewModel {
    var xDomain: ClosedRange<Date> {
        // Используем ВСЕ данные для оси X (включая нули)
        guard
            let first = data.first?.date,
            let last = data.last?.date,
            data.count > 1
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

// MARK: - Chart mapper
extension LineChartViewModel {
    func setData(_ source: [HealthInfoDM]) {
        // Линия рисуется только для ненулевых значений
        let filtered = source.filter { $0.value > 0 }
        
        let items = filtered.map {
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
        guard value != 0 else {
            return false
        }
        return abs(value - markedLineValue) < 0.0001
    }
}
