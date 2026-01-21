//
//  BarChartComponent.swift
//  HealthTraker
//
//  Created by User on 15/01/26.
//

import Charts
import SwiftUI


// MARK: - View
struct BarChartComponent: View {
    @ObservedObject var viewModel: BarChartViewModel
    @State private var revealProgress: CGFloat = 0
    var body: some View {
        Chart {
            if viewModel.showPointValues {
                valueAnnotations
            }
            if viewModel.markedLineValue > 0 {
                markedLine
            }
            barMarks
        }
        .chartYScale(domain: viewModel.getChartYRange())
        .chartXScale(domain: viewModel.xDomain)
        .chartXAxis { xAxis }
        .chartYAxis { yAxis }
        .padding()
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.easeOut(duration: 0.8)) {
                revealProgress = 1
            }
        }
    }
}

// MARK: - Chart Bar
private extension BarChartComponent {
    var barMarks: some ChartContent {
        ForEach(viewModel.animatedData, id: \.id) { item in
            BarMark(
                x: .value("Index", item.date),
                y: .value("Value", item.animatedValue),
                width: .fixed(viewModel.barWidth),
                height: .automatic,
                stacking: .standard
            )
            .clipShape(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
            )
            .foregroundStyle(
                viewModel.barType == .mono
                ? ColorLibrary.teal.color
                : Color.calculated(for: item.animatedValue)
            )
            
        }
    }
}

// MARK: - Marked Line
private extension BarChartComponent {
    var markedLine: some ChartContent {
        RuleMark(
            y: .value("line value", viewModel.markedLineValue)
        )
        .lineStyle(
            StrokeStyle(lineWidth: 1, dash: [6, 4])
        )
        .foregroundStyle(ColorLibrary.white.color)
    }
}

// MARK: - Pointer values
private extension BarChartComponent {
    var valueAnnotations: some ChartContent {
        ForEach(viewModel.animatedData, id: \.id) { item in
            PointMark(
                x: .value("X", item.date),
                y: .value("Y", item.animatedValue)
            )
            .foregroundStyle(.clear)
            .annotation(position: .top) {
                Text(
                    item.animatedValue.valueFormatter(inPercent: viewModel.isPercentage)
                )
                .font(.caption2)
                .offset(y: -8)
                .foregroundStyle(ColorLibrary.white.color)
            }
        }
    }
}

// MARK: - X Axis
private extension BarChartComponent {
    var xAxis: some AxisContent {
        let lastDate = viewModel.data.last?.date

        return AxisMarks(values: viewModel.data.map(\.date)) { value in
            AxisValueLabel(centered: false, multiLabelAlignment: .leading, horizontalSpacing: 0) {
                if
                    let date = value.as(Date.self),
                    let point = viewModel.animatedData.first(where: { $0.date == date })
                {
                    Text(point.label)
                        .font(.caption2)
                        .fixedSize()
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(
                            date == lastDate
                            ? Color.white
                            : Color.white
                        )
                        .foregroundStyle(
                            date == lastDate
                            ? Color.black
                            : Color.black//ColorLibrary.white.withAlphaComponent(0.3).color
                        )
                        .clipShape(Capsule())
                        .offset(x: -12)
                }
            }
        }
    }
}

// MARK: - Y Axis
private extension BarChartComponent {
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
    let viewmodel = BarChartViewModel()
    viewmodel.data = Mocks.recoveryData(range: .week)
    viewmodel.barType = .colorful
    viewmodel.showPointValues = false
    viewmodel.yValues = [0,20,40,60,80,100]
    
    return BarChartComponent(
        viewModel: viewmodel
    )
    .padding()
    .background(.clear)
}
