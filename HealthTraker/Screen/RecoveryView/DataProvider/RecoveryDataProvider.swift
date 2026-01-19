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
            tableView.reloadRows(at: [.init(row: 2, section: 0)], with: .none)
        }
    }
    var recoverySelectedData: HealthInfoDM? {
        didSet {
            tableView.reloadRows(at: [.init(row: 1, section: 0)], with: .none)
        }
    }
    var recoveryData: [HealthInfoDM] = [] {
        didSet {
            tableView.reloadRows(at: [.init(row: 2, section: 0)], with: .none)
        }
    }
    var vsrData: [HealthInfoDM] = [] {
        didSet {
            tableView.reloadRows(at: [.init(row: 3, section: 0)], with: .none)
        }
    }
    var pulseData: [HealthInfoDM] = [] {
        didSet {
            tableView.reloadRows(at: [.init(row: 4, section: 0)], with: .none)
        }
    }
    var breathData: [HealthInfoDM] = [] {
        didSet {
            tableView.reloadRows(at: [.init(row: 5, section: 0)], with: .none)
        }
    }
    var sleepData: [HealthInfoDM] = [] {
        didSet {
            tableView.reloadRows(at: [.init(row: 6, section: 0)], with: .none)
        }
    }
    var delegate: RecoveryDataProviderDelegate?
    
    private unowned let tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.register(CalendarTableViewCell.self, forCellReuseIdentifier: CalendarTableViewCell.string)
        tableView.register(RecoveryTableViewCell.self, forCellReuseIdentifier: RecoveryTableViewCell.string)
        tableView.register(RecoveryChartTableViewCell.self, forCellReuseIdentifier: RecoveryChartTableViewCell.string)
        tableView.register(LineChartTableViewCell.self, forCellReuseIdentifier: LineChartTableViewCell.string)
        tableView.register(BarChartTableViewCell.self, forCellReuseIdentifier: BarChartTableViewCell.string)
    }
}

extension RecoveryDataProvider {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            // MARK: - Calendar
        case 0:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CalendarTableViewCell.string,
                for: indexPath
            ) as? CalendarTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            cell.configureCell(data: recoveryData)
            return cell
            
            // MARK: - Recovery percentage
        case 1:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: RecoveryTableViewCell.string,
                for: indexPath
            ) as? RecoveryTableViewCell else { return UITableViewCell() }
            cell.configureCell(data: recoverySelectedData)
            return cell
            
            // MARK: - Recovery Barchart
        case 2:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: RecoveryChartTableViewCell.string,
                for: indexPath
            ) as? RecoveryChartTableViewCell else { return UITableViewCell() }
            cell.configureChart(range: selectedRange, yValues: [0,34,67,100], data: recoveryData)
            
            cell.configureMetrics([
                .init(icon: UIImage(named: "vsr_ic"),
                      title: "вариабельность сердечного ритма",
                      value: "\(Int(vsrData.last?.value ?? 0))",
                      trendIcon: UIImage(systemName: "arrowtriangle.down.fill"),
                      trendColor: .systemYellow),
                .init(icon: UIImage(named: "pulse_ic"),
                      title: "пульс в покое",
                      value: "\(Int(pulseData.last?.value ?? 0))",
                      trendIcon: UIImage(systemName: "arrowtriangle.down.fill"),
                      trendColor: .systemYellow),
                .init(icon: UIImage(named: "lungs_ic"),
                      title: "вдохов в минуту",
                      value: "\(breathData.last?.value ?? 0)",
                      trendIcon: UIImage(systemName: "arrowtriangle.up.fill"),
                      trendColor: .systemGreen),
                .init(icon: UIImage(named: "moon_ic"),
                      title: "результативность сна",
                      value: "\(Int(sleepData.last?.value ?? 0))%",
                      trendIcon: UIImage(systemName: "arrowtriangle.up.fill"),
                      trendColor: .systemGreen)
            ])
            cell.onRangeChanged = { self.delegate?.rangeChanged(range: $0) }
            return cell
            
            // MARK: - VSR Linechart
        case 3:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: LineChartTableViewCell.string,
                for: indexPath
            ) as? LineChartTableViewCell else { return UITableViewCell() }
            cell.configureCell(icon: "vsr_ic", title: "ВСР", yValues: [20,30,40,50,60], data: vsrData)
            return cell
            
            // MARK: - Pulse Linechart
        case 4:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: LineChartTableViewCell.string,
                for: indexPath
            ) as? LineChartTableViewCell else { return UITableViewCell() }
            cell.configureCell(icon: "pulse_ic", title: "Пульс в покое", yValues: [40,50,60,70,80], data: pulseData)
            return cell
            
            // MARK: - Breath Linechart
        case 5:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: LineChartTableViewCell.string,
                for: indexPath
            ) as? LineChartTableViewCell else { return UITableViewCell() }
            cell.configureCell(icon: "lungs_ic", title: "Вдохов в минуту", yValues: [12,13,14,15,16], data: breathData)
            return cell
            
            // MARK: - Sleep Barchart
        case 6:
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

extension RecoveryDataProvider: CalendarTableViewCellDelegate {
    func dateChanged(date: Date) {
        delegate?.dateChanged(date: date)
    }
}
