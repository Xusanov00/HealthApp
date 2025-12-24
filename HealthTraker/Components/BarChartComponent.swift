//
//  BarChartComponent.swift
//  HealthTraker
//
//  Created by Ali
//

import Charts
import SwiftUI

struct BarChartComponent: View {

    var content: [HealthInfoDM]
    let labelFormatter: (Date) -> String

    var barType: BarType = .mono
    var barColor: Color = .teal
    var isBarTextHidden: Bool = true
    var backgroundColor: Color = .black
    var yRange: ClosedRange<Double> = 0...120

    private var barWidth: CGFloat {
        barType == .mono ? 10 : 15
    }
    private var xDomain: ClosedRange<Double> {
        guard !content.isEmpty else { return 0...1 }
        return -0.1 ... Double(content.count) - 0.5
    }

    var body: some View {
        Chart {
            bars
        }
        .frame(height: 220)
        .chartXScale(domain: xDomain)
        .chartPlotStyle { plotArea in
            plotArea.padding(.horizontal, barWidth / 2)
        }
        .chartYScale(domain: yRange)
        .chartXAxis { xAxis }
        .chartYAxis { yAxis }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 28)
                .fill(backgroundColor)
        )
    }
}

// MARK: - Chart parts
private extension BarChartComponent {

    var bars: some ChartContent {
        ForEach(Array(content.enumerated()), id: \.element.id) { index, item in
            BarMark(
                x: .value("Index", index),
                y: .value("Value", item.value),
                width: .fixed(barWidth)
            )
            .clipShape(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
            )
            .foregroundStyle(
                barType == .mono
                ? barColor
                : Color.calculated(for: item.value)
            )
            .annotation(position: .top) {
                if !isBarTextHidden {
                    Text("\(Int(item.value))%")
                        .font(.caption)
                        .foregroundColor(.white)
                }
            }
        }
    }

    var xAxis: some AxisContent {
        AxisMarks(values: Array(content.indices)) { value in
            AxisValueLabel {
                if let index = value.as(Int.self),
                   index < content.count {
                    Text(labelFormatter(content[index].date))
                        .foregroundColor(.gray)
                }
            }
        }
    }

    var yAxis: some AxisContent {
        AxisMarks(position: .trailing) { value in
            AxisGridLine()
                .foregroundStyle(.gray.opacity(0.3))
            AxisValueLabel {
                if let v = value.as(Double.self) {
                    Text("\(Int(v))%")
                        .foregroundColor(.gray)
                        .font(.caption)
                }
            }
        }
    }
}

// MARK: - Types
extension BarChartComponent {
    enum BarType {
        case mono
        case colorful
    }
}

#Preview {
    BarChartComponent(
        content: Mocks().recoveryData,
        labelFormatter: labelFormatter, barType: .colorful,
        isBarTextHidden: true,
        backgroundColor: .black
        
    )
}

// MARK: - this should be in viewModel, its here temporary for checking
let dayLabelFormatter: (Date) -> String = { date in
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ru_RU")
    formatter.dateFormat = ""
    return formatter.string(from: date)
}

let range: ChartRange = .day

let labelFormatter: (Date) -> String = {
    switch range {
    case .day:
        return { $0.formatted(.dateTime.weekday(.abbreviated)) }
    case .week:
        return { "W\(Calendar.current.component(.weekOfYear, from: $0))" }
    case .month:
        return { $0.formatted(.dateTime.month(.abbreviated)) }
    }
}()
