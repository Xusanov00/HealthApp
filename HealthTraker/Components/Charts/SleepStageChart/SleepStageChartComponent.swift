//
//  SleepStageChartComponent.swift
//  HealthTraker
//
//  Created by User on 06/02/26.
//

import Charts
import SwiftUI

struct SleepStageChartComponent: View {
    @ObservedObject var viewModel: SleepStageChartViewModel

    var body: some View {
        Chart {
            ForEach(viewModel.segments) { segment in
                BarMark(
                    x: .value("Date", segment.date),
                    yStart: .value("Start", segment.yStart),
                    yEnd: .value("End", segment.animatedEnd),
                    width: .fixed(viewModel.barWidth)
                )
                .foregroundStyle(stageColor(segment.stage))
            }
        }
        .chartYScale(domain: viewModel.getChartYRange())
        .chartXScale(domain: viewModel.xDomain)
        .chartXAxis { xAxis }
        .chartYAxis { yAxis }
        .padding()
        .ignoresSafeArea()
    }
}

// MARK: - X Axis
private extension SleepStageChartComponent {
    var xAxis: some AxisContent {
        let highlighted = viewModel.highlightedDate
        return AxisMarks(preset: .aligned, position: .bottom, values: viewModel.xItems.map(\.date)) { value in
            AxisValueLabel() {
                if let date = value.as(Date.self),
                   let item = viewModel.xItems.first(where: { $0.date == date }) {
                    Text(item.label)
                        .font(.caption2)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(
                            date == highlighted ? Color.white : .clear
                        )
                        .foregroundStyle(
                            date == highlighted ? Color.black : .white.opacity(0.3)
                        )
                        .clipShape(Capsule())
                }
            }
        }
    }
}

// MARK: - Y Axis
private extension SleepStageChartComponent {
    var yAxis: some AxisContent {
        AxisMarks(position: .trailing, values: viewModel.yAxisValues) { axisValue in
            if let value = axisValue.as(Double.self) {
                AxisGridLine()
                    .foregroundStyle(.white.opacity(0.2))

                AxisValueLabel(horizontalSpacing: 10) {
                    Text(viewModel.timeLabel(for: value))
                        .font(.caption2)
                        .foregroundStyle(.white.opacity(0.3))
                }
            }
        }
    }
}

// MARK: - Colors
private extension SleepStageChartComponent {
    func stageColor(_ stage: SleepStageChartModel.Stage) -> Color {
        switch stage {
        case .awake: return ColorLibrary.red.color
        case .rem: return ColorLibrary.orange.color
        case .light: return ColorLibrary.teal.color
        case .deep: return ColorLibrary.blue.color
        }
    }
}
