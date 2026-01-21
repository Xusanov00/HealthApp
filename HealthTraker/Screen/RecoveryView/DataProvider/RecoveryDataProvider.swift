//
//  RecoveryDataProvider.swift
//  HealthTraker
//
//  Created by Ali on 22/12/2025.
//


import UIKit

protocol RecoveryDataProviderDelegate {
    func dateChanged(date: Date)
    func rangeChanged(range: ChartRange)
}

final class RecoveryDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    var onRangeChanged: ((ChartRange) -> Void)?
    
    // user data
    var selectedRange: ChartRange? {
        didSet {
            tableView.reloadRows(at: [.init(row: 0, section: 1)], with: .none)
        }
    }
    var recoverySelectedData: HealthInfoDM? {
        didSet {
            recoveryHeaderView?.configureHeader(data: recoverySelectedData)
        }
    }
    var calendarRecoveryData: [HealthInfoDM] = []
    var recoveryData: [HealthInfoDM] = []
    var vsrData: [HealthInfoDM] = [] {
        didSet {
            tableView.reloadRows(at: [.init(row: 1, section: 1)], with: .none)
        }
    }
    var pulseData: [HealthInfoDM] = [] {
        didSet {
            tableView.reloadRows(at: [.init(row: 2, section: 1)], with: .none)
        }
    }
    var breathData: [HealthInfoDM] = [] {
        didSet {
            tableView.reloadRows(at: [.init(row: 3, section: 1)], with: .none)
        }
    }
    var sleepData: [HealthInfoDM] = [] {
        didSet {
            tableView.reloadRows(at: [.init(row: 4, section: 1)], with: .none)
        }
    }
    
    var delegate: RecoveryDataProviderDelegate?
    private weak var recoveryHeaderView: RecoveryHeaderView?
    private let tableView: UITableView

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.register(CalendarTableViewCell.self, forCellReuseIdentifier: CalendarTableViewCell.string)
        tableView.register(RecoveryChartTableViewCell.self, forCellReuseIdentifier: RecoveryChartTableViewCell.string)
        tableView.register(LineChartTableViewCell.self, forCellReuseIdentifier: LineChartTableViewCell.string)
        tableView.register(BarChartTableViewCell.self, forCellReuseIdentifier: BarChartTableViewCell.string)
    }
}

extension RecoveryDataProvider {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 5
        default: return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section, indexPath.row) {
            // MARK: - Calendar
        case (0, 0):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CalendarTableViewCell.string,
                for: indexPath
            ) as? CalendarTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            cell.configureCell(data: calendarRecoveryData)
            return cell

            // MARK: - Recovery Barchart
        case (1,0):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: RecoveryChartTableViewCell.string,
                for: indexPath
            ) as? RecoveryChartTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            cell.configureChart(range: selectedRange, yValues: [0,34,67,70,100], data: recoveryData)
            cell.configureMetrics([
                .init(
                    data: vsrData,
                    icon: "vsr_ic",
                    subtitle: "вариабельность сердечного ритма",
                ),
                .init(
                    data: pulseData,
                    icon: "pulse_ic",
                    subtitle: "пульс в покое",
                ),
                .init(
                    data: breathData,
                    icon: "lungs_ic",
                    subtitle: "вдохов в минуту",
                ),
                .init(
                    data: sleepData,
                    icon: "moon_ic",
                    subtitle: "результативность сна",
                    inPercent: true,
                ),
            ])
            return cell
            
            // MARK: - VSR Linechart
        case (1,1):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: LineChartTableViewCell.string,
                for: indexPath
            ) as? LineChartTableViewCell else { return UITableViewCell() }
            cell.configureCell(icon: "vsr_ic", title: "ВСР", yValues: [20,30,40,50,60], data: vsrData)
            return cell
            
            // MARK: - Pulse Linechart
        case (1,2):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: LineChartTableViewCell.string,
                for: indexPath
            ) as? LineChartTableViewCell else { return UITableViewCell() }
            cell.configureCell(icon: "pulse_ic", title: "Пульс в покое", yValues: [40,50,60,70,80], data: pulseData)
            return cell
            
            // MARK: - Breath Linechart
        case (1,3):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: LineChartTableViewCell.string,
                for: indexPath
            ) as? LineChartTableViewCell else { return UITableViewCell() }
            cell.configureCell(icon: "lungs_ic", title: "Вдохов в минуту", yValues: [12,13,14,15,16], data: breathData)
            return cell
            
            // MARK: - Sleep Barchart
        case (1,4):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: BarChartTableViewCell.string,
                for: indexPath
            ) as? BarChartTableViewCell else { return UITableViewCell() }
            cell.configureCell(icon: "moon_ic", title: "Сон", yValues: [0,20,40,60,80,100], data: sleepData)
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - Recovery Header View
extension RecoveryDataProvider {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 1 else { return nil }
        let header = RecoveryHeaderView()
        header.configureHeader(data: recoverySelectedData)
        self.recoveryHeaderView = header
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 1 ? 160 : 0
    }
    
    // removes padding above the headerView
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        0
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        UIView(frame: .zero)
    }
}

// MARK: - Stretch Header View
extension RecoveryDataProvider {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = tableView.tableHeaderView else { return }

        let offset = scrollView.contentOffset.y
        if offset < 0 {
            header.frame.size.height = 160 + abs(offset)
            tableView.tableHeaderView = header
        }
    }
}

// MARK: - Date selection
extension RecoveryDataProvider: CalendarTableViewCellDelegate {
    func dateChanged(date: Date) {
        delegate?.dateChanged(date: date)
    }
}

extension RecoveryDataProvider: RecoveryChartTableViewCellDelegate {
    func rangeChanged(range: ChartRange) {
        delegate?.rangeChanged(range: range)
    }
}
