//
//  LineChartComponent.swift
//  HealthTraker
//
//  Created by Ali on 19/12/2025.
//

import Charts
import SwiftUI

// MARK: - View

struct LineChartComponent: View {

    let parameters: LineChartParameters

    var body: some View {
        Chart {
            if parameters.isAreaVisible {
                areaMarks
            }

            lineMarks
            pointMarks

            if !parameters.isPointValueHidden {
                valueAnnotations
            }
        }
        .frame(height: 200)
        .chartYScale(domain: parameters.yRange)
        .chartYAxis {
            AxisMarks(position: .trailing) {
                AxisGridLine().foregroundStyle(.gray.opacity(0.3))
                AxisValueLabel().foregroundStyle(.gray)
            }
        }
        .chartXAxis {
            AxisMarks { value in
                AxisValueLabel {
                    if let date = value.as(Date.self) {
                        Text(label(for: date))
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 28)
                .fill(parameters.backgroundColor)
        )
    }
}

// MARK: - Parameters

extension LineChartComponent {
    struct LineChartParameters {
        let backgroundColor: Color
        let content: [HealthInfoDM]
        let labelMode: ChartRange

        let isAreaVisible: Bool
        let isPointValueHidden: Bool
        let lineWidth: CGFloat
        let yRange: ClosedRange<Double>

        init(
            backgroundColor: Color,
            content: [HealthInfoDM],
            labelMode: ChartRange,

            isAreaVisible: Bool = true,
            isPointValueHidden: Bool = true,
            lineWidth: CGFloat = 3,
            yRange: ClosedRange<Double> = 0...110
        ) {
            self.backgroundColor = backgroundColor
            self.content = content
            self.labelMode = labelMode
            self.isAreaVisible = isAreaVisible
            self.isPointValueHidden = isPointValueHidden
            self.lineWidth = lineWidth
            self.yRange = yRange
        }
    }
}

// MARK: - Marks

private extension LineChartComponent {

    var lineMarks: some ChartContent {
        ForEach(parameters.content) { item in
            LineMark(
                x: .value("Date", item.date),
                y: .value("Value", Double(item.value))
            )
            .lineStyle(.init(lineWidth: parameters.lineWidth))
            .foregroundStyle(.green)
        }
    }

    var areaMarks: some ChartContent {
        ForEach(parameters.content) { item in
            AreaMark(
                x: .value("Date", item.date),
                yStart: .value("Min", parameters.yRange.lowerBound),
                yEnd: .value("Value", Double(item.value))
            )
            .foregroundStyle(
                LinearGradient(
                    colors: [.green.opacity(0.4), .clear],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
    }

    var pointMarks: some ChartContent {
        ForEach(parameters.content) { item in
            PointMark(
                x: .value("Date", item.date),
                y: .value("Value", Double(item.value))
            )
            .annotation(position: .overlay) {
                Circle()
                    .stroke(.green, lineWidth: 2)
                    .frame(width: 10, height: 10)
            }
        }
    }

    var valueAnnotations: some ChartContent {
        ForEach(parameters.content) { item in
            PointMark(
                x: .value("Date", item.date),
                y: .value("Value", Double(item.value))
            )
            .annotation(position: .top) {
                Text("\(item.value)")
                    .font(.caption)
                    .foregroundColor(.white)
            }
        }
    }
}

// MARK: - should be in viewModel

private extension LineChartComponent {

    func label(for date: Date) -> String {
        switch parameters.labelMode {
        case .day:
            return date.formatted(.dateTime.weekday(.abbreviated))
        case .week:
            return date.formatted(.dateTime.day())
        case .month:
            return date.formatted(.dateTime.month(.abbreviated))
        }
    }
}
