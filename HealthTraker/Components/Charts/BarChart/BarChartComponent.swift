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
            barMarks

            if viewModel.showPointValues {
                valueAnnotations
            }
        }
        .chartYScale(domain: viewModel.getChartYRange())
        .chartXScale(domain: viewModel.xDomain)
        .chartXAxis { xAxis }
        .chartYAxis { yAxis }
        .padding()
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
                : Color.calculated(for: item.value)
            )
            
        }
    }
}

// MARK: - Pointer values
private extension BarChartComponent {
    var valueAnnotations: some ChartContent {
        ForEach(viewModel.animatedData, id: \.id) { item in
            PointMark(
                x: .value("X", item.date),
                y: .value("Y", item.value)
            )
            .foregroundStyle(.clear)
            .annotation(position: .top) {
                Text(
                    item.value.formatted(
                        .number.precision(.fractionLength(0...1))
                    )
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
        AxisMarks(values: viewModel.animatedData.map(\.date)) { value in
            AxisValueLabel(verticalSpacing: 10) {
                if
                    let date = value.as(Date.self),
                    let point = viewModel.animatedData.first(where: { $0.date == date })
                {
                    Text(point.label)
                        .font(.caption2)
                        .fixedSize()
                        .offset(x: -12)
                        .foregroundStyle(ColorLibrary.gray4.color)
                }
            }
        }
    }
}

// MARK: - Y Axis
private extension BarChartComponent {
    var yAxis: some AxisContent {
        AxisMarks(position: .trailing, values: viewModel.yValues) { value in
            AxisGridLine().offset()
                .foregroundStyle(ColorLibrary.gray3.color)
            AxisValueLabel(horizontalSpacing: 10) {
                if let v = value.as(Double.self) {
                    Text(
                        v.formatted(
                            .number.precision(.fractionLength(0...1))
                        )
                    )
                    .font(.caption2)
                    .foregroundStyle(ColorLibrary.gray4.color)
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
