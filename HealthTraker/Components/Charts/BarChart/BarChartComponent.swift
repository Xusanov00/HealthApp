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
            if viewModel.markedValue > 0 {
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
            y: .value("line value", viewModel.markedValue)
        )
        .lineStyle(
            StrokeStyle(lineWidth: 1, dash: [6, 4])
        )
        .foregroundStyle(.white)
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
                    item.animatedValue != 0 ?
                    item.animatedValue.valueFormatter(inPercent: viewModel.isPercentage)
                    : ""
                    
                )
                .font(.caption2)
                .offset(y: -8)
                .foregroundStyle(.white)
            }
        }
    }
}

// MARK: - X Axis
private extension BarChartComponent {
    var xAxis: some AxisContent {
        let lastDate = viewModel.data.last?.date
        
        return AxisMarks(preset: .aligned, position: .bottom, values: viewModel.data.map(\.date)) { value in
            AxisValueLabel() {
                if let date = value.as(Date.self),
                   let point = viewModel.animatedData.first(where: { $0.date == date }) {
                    Text(point.label)
                        .font(.caption2)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(
                            date == lastDate
                            ? Color.white
                            : .clear
                        )
                        .foregroundStyle(
                            date == lastDate
                            ? Color.black
                            : .white.opacity(0.3)
                        )
                        .clipShape(Capsule())
                }
            }
        }
    }
}

// MARK: - Y Axis
private extension BarChartComponent {
    var yAxis: some AxisContent {
        AxisMarks(position: .trailing, values: viewModel.filteredYValues) { axisValue in
            if let value = axisValue.as(Double.self) {
                AxisGridLine()
                    .foregroundStyle(
                        viewModel.isMarkedValue(value)
                        ? .clear
                        : .white.opacity(0.2)
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
                        ? .white
                        : .white.opacity(0.3)
                    )
                }
            }
        }
    }
}
