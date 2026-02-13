//
//  SleepDataProvider.swift
//  HealthTraker
//
//  Created by Ali on 22/12/2025.
//


import UIKit

protocol SleepDataProviderDelegate: AnyObject {
    func dateChanged(date: Date)
    func rangeChanged(range: ChartRange)
    func sleepStageInfoTapped()
}

final class SleepDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    var onRangeChanged: ((ChartRange) -> Void)?
    
    // user data
    var selectedRange: ChartRange? {
        didSet {
            tableView.reloadRows(at: [.init(row: 0, section: 1)], with: .none)
        }
    }
    var sleepSelectedData: HealthInfoDM? {
        didSet {
            sleepHeaderView?.configureHeader(data: sleepSelectedData)
        }
    }
    var selectedDate: Date? {
        didSet {
            if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? CalendarTableViewCell {
                cell.configureCell(data: calendarSleepData, selectedDate: selectedDate, shouldScroll: false)
            }
        }
    }
    private var isInitialLoad = true
    var calendarSleepData: [HealthInfoDM] = []
    var sleepData: [HealthInfoDM] = []
    var sleepStageModel: SleepStageChartCardModel? {
        didSet {
            tableView.reloadRows(at: [.init(row: 1, section: 1)], with: .none)
        }
    }
    
    weak var delegate: SleepDataProviderDelegate?
    private weak var sleepHeaderView: SleepHeaderView?
    private let tableView: UITableView

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.register(SleepCalendarTableViewCell.self, forCellReuseIdentifier: SleepCalendarTableViewCell.string)
        tableView.register(SleepBarChartTableViewCell.self, forCellReuseIdentifier: SleepBarChartTableViewCell.string)
        tableView.register(SleepStageChartTableViewCell.self, forCellReuseIdentifier: SleepStageChartTableViewCell.string)
        tableView.register(SleepAdviceTableViewCell.self, forCellReuseIdentifier: SleepAdviceTableViewCell.string)
    }
}

extension SleepDataProvider {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 3
        default: return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section, indexPath.row) {
            // MARK: - Calendar
        case (0,0):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SleepCalendarTableViewCell.string,
                for: indexPath
            ) as? SleepCalendarTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            
            let shouldScroll = isInitialLoad
            if isInitialLoad {
                isInitialLoad = false
            }
            
            cell.configureCell(
                data: calendarSleepData,
                selectedDate: selectedDate,
                shouldScroll: shouldScroll
            )
            return cell

            // MARK: - Sleep Barchart
        case (1,0):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SleepBarChartTableViewCell.string,
                for: indexPath
            ) as? SleepBarChartTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            cell.configureChart(range: selectedRange, yValues: [0,34,67,70,100], data: sleepData)
            return cell
            
            // MARK: - SleepStage Сhart
        case (1,1):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SleepStageChartTableViewCell.string,
                for: indexPath
            ) as? SleepStageChartTableViewCell else { return UITableViewCell() }
            if let model = sleepStageModel {
                cell.configure(model)
                cell.delegate = self
            }
            return cell
            
            // MARK: - Sleep time Dynamic chart
        case (1,2):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SleepAdviceTableViewCell.string,
                for: indexPath
            ) as? SleepAdviceTableViewCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - Sleep Header View
extension SleepDataProvider {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 1 else { return nil }
        let header = SleepHeaderView()
        header.configureHeader(data: sleepSelectedData)
        self.sleepHeaderView = header
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
extension SleepDataProvider {
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
extension SleepDataProvider: SleepCalendarTableViewCellDelegate {
    func dateChanged(date: Date) {
        delegate?.dateChanged(date: date)
    }
}

extension SleepDataProvider: SleepBarChartTableViewCellDelegate {
    func rangeChanged(range: ChartRange) {
        delegate?.rangeChanged(range: range)
    }
}

extension SleepDataProvider: SleepStageChartTableViewCellDelegate {
    func sleepStageInfoTapped() {
        delegate?.sleepStageInfoTapped()
    }
}
