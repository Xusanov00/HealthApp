//
//  SleepStageChartViewModel.swift
//  HealthTraker
//
//  Created by User on 06/02/26.
//

import SwiftUI

final class SleepStageChartViewModel: ObservableObject {
    struct RenderSegment: Identifiable {
        let id: UUID
        let date: Date
        let label: String
        let isHighlighted: Bool
        let stage: SleepStageChartModel.Stage
        let yStart: Double
        let yEnd: Double
        var animatedEnd: Double
    }

    struct XItem: Identifiable {
        let id: UUID
        let date: Date
        let label: String
        let isHighlighted: Bool
    }

    // MARK: - Published
    @Published private(set) var segments: [RenderSegment] = []
    @Published private(set) var xItems: [XItem] = []
    @Published private(set) var yAxisValues: [Double] = []

    // MARK: - Config
    var barWidth: CGFloat { 20 }

    // MARK: - Axis state
    private var axisStartMinutes: Int = 18 * 60
    private var axisWindowMinutes: Int = 24 * 60
    private let preferredCutMinutes: Int

    init(preferredCutMinutes: Int = 18 * 60) {
        self.preferredCutMinutes = preferredCutMinutes
    }

    // MARK: - Public
    func setData(_ model: SleepStageChartModel) {
        xItems = model.days.map {
            XItem(
                id: $0.id,
                date: $0.date,
                label: $0.label,
                isHighlighted: $0.isHighlighted
            )
        }

        let axis = computeAxis(model.days)
        axisStartMinutes = axis.start
        axisWindowMinutes = axis.window
        yAxisValues = buildAxisValues(windowMinutes: axisWindowMinutes)

        let render = buildRenderSegments(model.days)
        segments = render.map { seg in
            RenderSegment(
                id: seg.id,
                date: seg.date,
                label: seg.label,
                isHighlighted: seg.isHighlighted,
                stage: seg.stage,
                yStart: seg.yStart,
                yEnd: seg.yEnd,
                animatedEnd: seg.yStart
            )
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) {
            withAnimation(.easeOut(duration: 0.6)) {
                self.segments = render
            }
        }
    }

    func getChartYRange() -> ClosedRange<Double> {
        0...Double(max(axisWindowMinutes, 1))
    }

    var xDomain: ClosedRange<Date> {
        guard
            let first = xItems.first?.date,
            let last = xItems.last?.date
        else {
            let now = Date()
            return now...now
        }

        guard xItems.count > 1 else {
            let padding: TimeInterval = 60 * 60 * 12
            return first.addingTimeInterval(-padding)...first.addingTimeInterval(padding)
        }

        let step = xItems[1].date.timeIntervalSince(xItems[0].date)
        let padding = step * 0.3
        return first.addingTimeInterval(-padding)...last.addingTimeInterval(padding)
    }

    var highlightedDate: Date? {
        xItems.first(where: { $0.isHighlighted })?.date ?? xItems.last?.date
    }

    func timeLabel(for axisValue: Double) -> String {
        let inverted = axisWindowMinutes - Int(round(axisValue))
        let total = (axisStartMinutes + ((inverted % 1440) + 1440) % 1440) % 1440
        let h = total / 60
        let m = total % 60
        return String(format: "%02d:%02d", h, m)
    }
}

// MARK: - Axis logic
private extension SleepStageChartViewModel {
    struct Interval {
        let start: Int
        let end: Int
    }

    func computeAxis(_ days: [SleepStageChartModel.Day]) -> (start: Int, window: Int) {
        let intervals = buildCoverageIntervals(days)
        guard !intervals.isEmpty else {
            return (preferredCutMinutes, 1440)
        }

        let merged = mergeIntervals(intervals)

        var maxGap = 0
        var cut = preferredCutMinutes

        if merged.count > 1 {
            for i in 0..<(merged.count - 1) {
                let gap = merged[i + 1].start - merged[i].end
                if gap > maxGap {
                    maxGap = gap
                    cut = merged[i + 1].start
                }
            }
        }

        let wrapGap = (merged.first!.start + 1440) - merged.last!.end
        if wrapGap > maxGap {
            maxGap = wrapGap
            cut = merged.first!.start
        }

        if maxGap == 0 {
            return (preferredCutMinutes, 1440)
        }

        return (cut, 1440 - maxGap)
    }

    func buildCoverageIntervals(_ days: [SleepStageChartModel.Day]) -> [Interval] {
        var result: [Interval] = []

        for day in days {
            let sumSegments = day.segments.reduce(0) { $0 + $1.durationMinutes }
            let duration = durationMinutes(start: day.startMinutes, end: day.endMinutes)

            if duration == 0 {
                if sumSegments > 0 {
                    return [Interval(start: 0, end: 1440)]
                }
                continue
            }

            if day.endMinutes > day.startMinutes {
                result.append(Interval(start: day.startMinutes, end: day.endMinutes))
            } else if day.endMinutes < day.startMinutes {
                result.append(Interval(start: day.startMinutes, end: 1440))
                result.append(Interval(start: 0, end: day.endMinutes))
            }
        }

        return result
    }

    func mergeIntervals(_ intervals: [Interval]) -> [Interval] {
        let sorted = intervals.sorted { $0.start < $1.start }
        var merged: [Interval] = []

        for item in sorted {
            if let last = merged.last, item.start <= last.end {
                let newEnd = max(last.end, item.end)
                merged[merged.count - 1] = Interval(start: last.start, end: newEnd)
            } else {
                merged.append(item)
            }
        }

        return merged
    }

    func buildAxisValues(windowMinutes: Int) -> [Double] {
        let window = max(windowMinutes, 1)
        let stepMinutes = niceStepMinutes(for: Double(window))
        var values: [Double] = []
        var v: Double = 0
        while v <= Double(window) {
            values.append(v)
            v += stepMinutes
        }
        if values.last != Double(window) {
            values.append(Double(window))
        }
        return values
    }

    func niceStepMinutes(for windowMinutes: Double) -> Double {
        let hours = max(windowMinutes / 60.0, 1)
        let stepHours = niceStep(for: hours)
        return max(stepHours * 60.0, 60.0)
    }

    func niceStep(for value: Double) -> Double {
        let targetTicks = 4.0
        let raw = value / targetTicks
        guard raw > 0 else { return 1 }

        let magnitude = pow(10.0, floor(log10(raw)))
        let residual = raw / magnitude

        let niceResidual: Double
        if residual <= 1 {
            niceResidual = 1
        } else if residual <= 2 {
            niceResidual = 2
        } else if residual <= 5 {
            niceResidual = 5
        } else {
            niceResidual = 10
        }

        return niceResidual * magnitude
    }
}

// MARK: - Render segments
private extension SleepStageChartViewModel {
    func buildRenderSegments(_ days: [SleepStageChartModel.Day]) -> [RenderSegment] {
        var output: [RenderSegment] = []
        let boundary = Double(max(axisWindowMinutes, 1))
        let allowWrap = axisWindowMinutes == 1440

        for day in days {
            let sumSegments = day.segments.reduce(0) { $0 + $1.durationMinutes }
            if sumSegments == 0 { continue }

            var duration = durationMinutes(start: day.startMinutes, end: day.endMinutes)
            if duration == 0 {
                duration = sumSegments
            }

            let scale = sumSegments > 0 ? (duration / sumSegments) : 1
            var cursor = relativeMinute(day.startMinutes)

            for segment in day.segments {
                var remaining = segment.durationMinutes * scale
                if remaining <= 0 { continue }

                if !allowWrap {
                    let part = min(remaining, max(boundary - cursor, 0))
                    if part > 0 {
                        let invStart = boundary - (cursor + part)
                        let invEnd = boundary - cursor
                        output.append(RenderSegment(
                            id: UUID(),
                            date: day.date,
                            label: day.label,
                            isHighlighted: day.isHighlighted,
                            stage: segment.stage,
                            yStart: invStart,
                            yEnd: invEnd,
                            animatedEnd: invEnd
                        ))
                    }
                    cursor = min(cursor + part, boundary)
                    continue
                }

                while remaining > 0 {
                    let available = boundary - cursor
                    if available <= 0 {
                        cursor = 0
                        continue
                    }
                    let part = min(remaining, available)
                    let invStart = boundary - (cursor + part)
                    let invEnd = boundary - cursor
                    output.append(RenderSegment(
                        id: UUID(),
                        date: day.date,
                        label: day.label,
                        isHighlighted: day.isHighlighted,
                        stage: segment.stage,
                        yStart: invStart,
                        yEnd: invEnd,
                        animatedEnd: invEnd
                    ))
                    remaining -= part
                    cursor = remaining > 0 ? 0 : (cursor + part)
                }
            }
        }

        return output
    }

    func relativeMinute(_ minute: Int) -> Double {
        let diff = minute - axisStartMinutes
        let mod = (diff % 1440 + 1440) % 1440
        return Double(mod)
    }

    func durationMinutes(start: Int, end: Int) -> Double {
        let diff = (end - start + 1440) % 1440
        return Double(diff)
    }
}
