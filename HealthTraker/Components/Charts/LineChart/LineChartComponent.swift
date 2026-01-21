//
//  LineChartComponent.swift
//  HealthTraker
//
//  Created by User on 15/01/26.
//

import Charts
import SwiftUI

// MARK: - View
struct LineChartComponent: View {
    @ObservedObject var viewModel: LineChartViewModel
    @State private var revealProgress: CGFloat = 0
    
    var body: some View {
        Chart {
            lineMarks
            areaMarks
            pointMarks
            
            if viewModel.showPointValues {
                valueAnnotations
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

// MARK: - Chart Line
private extension LineChartComponent {
    var lineMarks: some ChartContent {
        ForEach(viewModel.animatedData) { item in
            LineMark(
                x: .value("X", item.date),
                y: .value("Y", item.animatedValue)
            )
            .lineStyle(.init(lineWidth: 2))
            .foregroundStyle(viewModel.lineColor)
        }
    }
}

// MARK: - Gradient underline
private extension LineChartComponent {
    var areaMarks: some ChartContent {
        ForEach(viewModel.animatedData) { item in
            AreaMark(
                x: .value("X", item.date),
                yStart: .value("Min", viewModel.getChartYRange().lowerBound),
                yEnd: .value("Y", item.animatedValue)
            )
            .foregroundStyle(
                LinearGradient(
                    colors: [viewModel.lineColor.opacity(0.4), .clear],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
    }
}

// MARK: - Pointers
private extension LineChartComponent {
    var pointMarks: some ChartContent {
        ForEach(viewModel.animatedData) { item in
            PointMark(
                x: .value("X", item.date),
                y: .value("Y", item.animatedValue)
            )
            .symbol {
                Circle()
                    .stroke(viewModel.lineColor, lineWidth: 2)
                    .frame(width: 10, height: 10)
                    .background(ColorLibrary.gray1.color)
            }
        }
    }
}

// MARK: - Pointer values
private extension LineChartComponent {
    var valueAnnotations: some ChartContent {
        ForEach(viewModel.animatedData) { item in
            PointMark(
                x: .value("X", item.date),
                y: .value("Y", item.animatedValue)
            ).foregroundStyle(.clear)
                .annotation(position: .top) {
                    Text(
                        item.value.formatted(
                            .number.precision(.fractionLength(0...1))
                        )
                    )
                    .foregroundStyle(ColorLibrary.white.color)
                    .font(.caption2)
                    .offset(y: -8)
                }
        }
    }
}

// MARK: - X Axis
private extension LineChartComponent {
    var xAxis: some AxisContent {
        let lastDate = viewModel.data.last?.date

        return AxisMarks(values: viewModel.data.map(\.date)) { value in
            AxisValueLabel(verticalSpacing: 10) {
                if
                    let date = value.as(Date.self),
                    let point = viewModel.animatedData.first(where: { $0.date == date })
                {
                    Text(point.label)
                        .font(.caption2)
                        .fixedSize()
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(
                            date == lastDate
                            ? Color.white
                            : Color.clear
                        )
                        .foregroundStyle(
                            date == lastDate
                            ? Color.black
                            : ColorLibrary.white.withAlphaComponent(0.3).color
                        )
                        .clipShape(Capsule())
                        .offset(x: -12)
                }
            }
        }
    }
}

// MARK: - Y Axis
private extension LineChartComponent {
    var yAxis: some AxisContent {
        AxisMarks(position: .trailing, values: viewModel.yValues) { axisValue in
            if let value = axisValue.as(Double.self) {
                AxisGridLine()
                    .foregroundStyle(
                        viewModel.isMarkedValue(value)
                        ? ColorLibrary.white.color
                        : ColorLibrary.white.withAlphaComponent(0.2).color
                    )

                AxisValueLabel(horizontalSpacing: 10) {
                    Text(
                        value.valueFormatter(
                            inPercent: viewModel.isPercentage
                        )
                    )
                    .font(.caption2)
                    .foregroundStyle(
                        viewModel.isMarkedValue(value)
                        ? ColorLibrary.white.color
                        : ColorLibrary.white.withAlphaComponent(0.3).color
                    )
                }
            }
        }
    }
}

#Preview("Narrow Range · 12–16") {
    let viewmodel = LineChartViewModel()
    viewmodel.data = Mocks.vsrData(range: .week)
    viewmodel.yValues = [20,30,40,50,60]
    viewmodel.showPointValues = true
    
    return LineChartComponent(viewModel: viewmodel)
    .padding()
    .background(.clear)
}
