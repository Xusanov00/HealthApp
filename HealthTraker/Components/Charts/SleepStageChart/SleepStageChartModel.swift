//
//  SleepStageChartModel.swift
//  HealthTraker
//
//  Created by User on 06/02/26.
//

import Foundation

struct SleepStageChartModel {
    struct Day: Identifiable {
        let id: UUID
        let date: Date
        let label: String
        let isHighlighted: Bool
        let startMinutes: Int
        let endMinutes: Int
        let segments: [Segment]
    }

    struct Segment: Identifiable {
        let id: UUID
        let stage: Stage
        let durationMinutes: Double
    }

    enum Stage: Int, CaseIterable {
        case awake
        case rem
        case light
        case deep
    }

    let days: [Day]
}

extension SleepStageChartModel {
    init(days: [SleepDayDM], range: ChartRange) {
        self.days = days.map { day in
            let segments = [
                Segment(id: UUID(), stage: .awake, durationMinutes: Self.minutesFromHours(Self.pickHours(day.periods.awake))),
                Segment(id: UUID(), stage: .rem, durationMinutes: Self.minutesFromHours(Self.pickHours(day.periods.rem))),
                Segment(id: UUID(), stage: .light, durationMinutes: Self.minutesFromHours(Self.pickHours(day.periods.light))),
                Segment(id: UUID(), stage: .deep, durationMinutes: Self.minutesFromHours(Self.pickHours(day.periods.deep)))
            ].filter { $0.durationMinutes > 0 }

            return Day(
                id: UUID(),
                date: day.date.toDate,
                label: day.date.chartLabel(for: range),
                isHighlighted: day.isCurrentDate,
                startMinutes: Self.minutesFromSeconds(day.avgStartTime),
                endMinutes: Self.minutesFromSeconds(day.avgEndTime),
                segments: segments
            )
        }
    }
}

private extension SleepStageChartModel {
    static func pickHours(_ info: SleepPeriodInfoDM) -> Double {
        info.averageTimeInHours > 0 ? info.averageTimeInHours : info.timeInHours
    }

    static func minutesFromHours(_ hours: Double) -> Double {
        max(0, hours * 60.0)
    }

    static func minutesFromSeconds(_ seconds: Int) -> Int {
        let mins = Int(round(Double(seconds) / 60.0))
        return ((mins % 1440) + 1440) % 1440
    }
}
