//
//  SleepStageChartCardModel.swift
//  HealthTraker
//
//  Created by User on 06/02/26.
//

import Foundation

struct SleepStageChartCardModel {
    struct StageRow: Identifiable {
        let id: SleepStageChartModel.Stage
        let stage: SleepStageChartModel.Stage
        let title: String
        let valueText: String
        let percentText: String
    }

    let averageSleepText: String
    let sleepNeedText: String
    let chartModel: SleepStageChartModel
    let stages: [StageRow]
}

extension SleepStageChartCardModel {
    init(days: [SleepDayDM], range: ChartRange) {
        let sourceDays = Self.filteredDays(days)
        let stageDay = Self.displayDay(sourceDays)

        let averageSleepHours = Self.average(
            sourceDays.map { $0.avgSleepTimeInHours > 0 ? $0.avgSleepTimeInHours : $0.sleepTimeInHours }
        )
        let averageNeedHours = Self.average(
            sourceDays.map { $0.avgSleepNeededInHours > 0 ? $0.avgSleepNeededInHours : $0.sleepNeededInHours }
        )

        let awakeInfo = stageDay?.periods.awake
        let remInfo = stageDay?.periods.rem
        let lightInfo = stageDay?.periods.light
        let deepInfo = stageDay?.periods.deep

        let awakeHours = Self.stageHours(awakeInfo)
        let remHours = Self.stageHours(remInfo)
        let lightHours = Self.stageHours(lightInfo)
        let deepHours = Self.stageHours(deepInfo)

        let totalHours = awakeHours + remHours + lightHours + deepHours

        self.averageSleepText = Self.formatHours(averageSleepHours)
        self.sleepNeedText = Self.formatHours(averageNeedHours)
        self.chartModel = SleepStageChartModel(days: days, range: range)
        self.stages = [
            StageRow(
                id: .awake,
                stage: .awake,
                title: "среднее время бодрствования",
                valueText: Self.stageValueText(awakeInfo),
                percentText: Self.stagePercentText(awakeInfo, total: totalHours)
            ),
            StageRow(
                id: .rem,
                stage: .rem,
                title: "среднее время быстрого сна",
                valueText: Self.stageValueText(remInfo),
                percentText: Self.stagePercentText(remInfo, total: totalHours)
            ),
            StageRow(
                id: .light,
                stage: .light,
                title: "среднее время легкого сна",
                valueText: Self.stageValueText(lightInfo),
                percentText: Self.stagePercentText(lightInfo, total: totalHours)
            ),
            StageRow(
                id: .deep,
                stage: .deep,
                title: "среднее время глубокого сна",
                valueText: Self.stageValueText(deepInfo),
                percentText: Self.stagePercentText(deepInfo, total: totalHours)
            )
        ]
    }
}

private extension SleepStageChartCardModel {
    static func displayDay(_ days: [SleepDayDM]) -> SleepDayDM? {
        days.first(where: { $0.isCurrentDate }) ?? days.last
    }

    static func filteredDays(_ days: [SleepDayDM]) -> [SleepDayDM] {
        let valid = days.filter { totalSleepHours($0) > 0 }
        return valid.isEmpty ? days : valid
    }

    static func totalSleepHours(_ day: SleepDayDM) -> Double {
        day.periods.awake.timeInHours
        + day.periods.rem.timeInHours
        + day.periods.light.timeInHours
        + day.periods.deep.timeInHours
    }

    static func average(_ values: [Double]) -> Double {
        guard !values.isEmpty else { return 0 }
        return values.reduce(0, +) / Double(values.count)
    }

    static func stageHours(_ info: SleepPeriodInfoDM?) -> Double {
        guard let info else { return 0 }
        return info.averageTimeInHours > 0 ? info.averageTimeInHours : info.timeInHours
    }

    static func stageValueText(_ info: SleepPeriodInfoDM?) -> String {
        guard let info else { return "0:00" }
        if !info.averageTimeFormatted.isEmpty {
            return info.averageTimeFormatted
        }
        if !info.timeFormatted.isEmpty {
            return info.timeFormatted
        }
        return formatHours(stageHours(info))
    }

    static func stagePercentText(_ info: SleepPeriodInfoDM?, total: Double) -> String {
        guard let info else { return "0%" }
        if info.percentage > 0 {
            return info.percentage.valueFormatter(inPercent: true)
        }
        return formatPercent(stageHours(info), total: total)
    }

    static func formatHours(_ hours: Double) -> String {
        guard hours > 0 else { return "0:00" }
        let totalMinutes = Int(round(hours * 60))
        let h = totalMinutes / 60
        let m = totalMinutes % 60
        return String(format: "%d:%02d", h, m)
    }

    static func formatPercent(_ value: Double, total: Double) -> String {
        guard total > 0 else { return "0%" }
        let percent = (value / total) * 100
        return percent.valueFormatter(inPercent: true)
    }
}
