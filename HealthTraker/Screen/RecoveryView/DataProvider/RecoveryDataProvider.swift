//
//  RecoveryDataProvider.swift
//  HealthTraker
//
//  Created by Ali on 22/12/2025.
//


import UIKit

final class RecoveryDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    var onDateSelected: ((Date) -> Void)?
    var onRangeChanged: ((ChartRange) -> Void)?
    
    var recoveryData: [HealthInfoDM] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var pulseData: [HealthInfoDM] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var vsrData: [HealthInfoDM] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var breathData: [HealthInfoDM] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var sleepData: [HealthInfoDM] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private unowned let tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
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
        case 0:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CalendarTableViewCell.string,
                for: indexPath
            ) as? CalendarTableViewCell else { return UITableViewCell() }
            cell.configureCell(data: recoveryData)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: RecoveryTableViewCell.string,
                for: indexPath
            ) as? RecoveryTableViewCell else { return UITableViewCell() }
            if let data = recoveryData.last {
                cell.configureCell(data: data)
            }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: RecoveryChartTableViewCell.string,
                for: indexPath
            ) as? RecoveryChartTableViewCell else { return UITableViewCell() }
            cell.configureChart(data: recoveryData)

            cell.configureMetrics([
                .init(icon: UIImage(systemName: "waveform.path.ecg"),
                      title: "вариабельность сердечного ритма",
                      value: "33",
                      trendIcon: UIImage(systemName: "arrow.down"),
                      trendColor: .systemYellow),

                .init(icon: UIImage(systemName: "heart"),
                      title: "пульс в покое",
                      value: "68",
                      trendIcon: UIImage(systemName: "arrow.down"),
                      trendColor: .systemYellow),

                .init(icon: UIImage(systemName: "lungs"),
                      title: "вдохов в минуту",
                      value: "14.0",
                      trendIcon: UIImage(systemName: "arrow.up"),
                      trendColor: .systemGreen),

                .init(icon: UIImage(systemName: "moon"),
                      title: "результативность сна",
                      value: "79%",
                      trendIcon: UIImage(systemName: "arrow.up"),
                      trendColor: .systemGreen)
            ])
            return cell
        case 3, 4, 5:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: LineChartTableViewCell.string,
                for: indexPath
            ) as? LineChartTableViewCell else { return UITableViewCell() }
            return cell
        case 6:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: BarChartTableViewCell.string,
                for: indexPath
            ) as? BarChartTableViewCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
}
