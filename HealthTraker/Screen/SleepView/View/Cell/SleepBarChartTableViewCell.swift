//
//  RecoveryChartTableViewCell.swift
//  HealthTraker
//
//  Created by Ali on 21/12/2025.
//

import UIKit
import SwiftUI

protocol SleepBarChartTableViewCellDelegate {
    func rangeChanged(range: ChartRange)
}

final class SleepBarChartTableViewCell: UITableViewCell {
    private let chartViewModel = BarChartViewModel()

    // MARK: - UI
    private let backView = UIView().configured { view in
        view.backgroundColor = .white.withAlphaComponent(0.1)
        view.layer.cornerRadius = 22
        view.clipsToBounds = true
    }
    private let titleLabel = UILabel().configured {
        $0.text = "Динамика"
        $0.font = .montserrat(ofSize: 20, weight: .bold)
        $0.textColor = .white
    }
    private lazy var hostingBarChart = UIHostingController(
        rootView: BarChartComponent(viewModel: chartViewModel)
    )

    private let dayButton = UIButton(type: .system)
    private let weekButton = UIButton(type: .system)
    private let monthButton = UIButton(type: .system)

    private lazy var buttonsStack = UIStackView(arrangedSubviews: [
        dayButton, weekButton, monthButton
    ]).configured {
        $0.axis = .horizontal
        $0.spacing = 4
        $0.distribution = .fillEqually
        $0.backgroundColor = .white.withAlphaComponent(0.05)
        $0.layer.cornerRadius = 20
    }


    // MARK: - State day/week/month
    private var selectedRange: ChartRange? {
        didSet { updateButtonsUI() }
    }
    
    var delegate: SleepBarChartTableViewCellDelegate?

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        selectionStyle = .none
        
        setupUI()
        setupActions()
        updateButtonsUI()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Setup UI
    private func setupUI() {
        hostingBarChart.view.backgroundColor = .clear
        hostingBarChart.view.clipsToBounds = true
        
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(backView)

        backView.addSubview(titleLabel)
        backView.addSubview(buttonsStack)
        backView.addSubview(hostingBarChart.view)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        hostingBarChart.view.translatesAutoresizingMaskIntoConstraints = false

        configureButton(dayButton, title: "День")
        configureButton(weekButton, title: "Неделя")
        configureButton(monthButton, title: "Месяц")

        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            
            titleLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16),

            buttonsStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            buttonsStack.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 8),
            buttonsStack.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -8),
            buttonsStack.heightAnchor.constraint(equalToConstant: 40),

            hostingBarChart.view.topAnchor.constraint(equalTo: buttonsStack.bottomAnchor, constant: 22),
            hostingBarChart.view.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            hostingBarChart.view.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            hostingBarChart.view.heightAnchor.constraint(equalToConstant: 200),
            hostingBarChart.view.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -4),
        ])
    }

    private func configureButton(_ button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 18
        button.backgroundColor = .clear
    }

    private func setupActions() {
        dayButton.addTarget(self, action: #selector(dayTapped), for: .touchUpInside)
        weekButton.addTarget(self, action: #selector(weekTapped), for: .touchUpInside)
        monthButton.addTarget(self, action: #selector(monthTapped), for: .touchUpInside)
    }

    // MARK: - Actions
    @objc private func dayTapped() { select(.day) }
    @objc private func weekTapped() { select(.week) }
    @objc private func monthTapped() { select(.month) }

    private func select(_ range: ChartRange) {
        if selectedRange == range { return }
        selectedRange = range
        delegate?.rangeChanged(range: range)
    }

    private func updateButtonsUI() {
        [dayButton, weekButton, monthButton].forEach {
            $0.backgroundColor = .clear
            $0.layer.cornerRadius = 20
        }

        switch selectedRange {
        case .day: dayButton.backgroundColor = .black
        case .week: weekButton.backgroundColor = .black
        case .month: monthButton.backgroundColor = .black
        case .none: break
        }
    }

    // MARK: - External config
    func configureChart(range: ChartRange?, yValues: [Double], data: [HealthInfoDM]) {
        selectedRange = range ?? .day
        chartViewModel.data = data
        chartViewModel.yValues = yValues
        chartViewModel.barType = .colorful
        chartViewModel.markedValue = 75
        chartViewModel.isPercentage = true
    }
}
