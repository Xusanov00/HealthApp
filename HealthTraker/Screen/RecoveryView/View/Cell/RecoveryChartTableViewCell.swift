//
//  RecoveryChartTableViewCell.swift
//  HealthTraker
//
//  Created by Ali on 21/12/2025.
//

import UIKit
import SwiftUI

final class RecoveryChartTableViewCell: UITableViewCell {

    // MARK: - Callback
    var onRangeChanged: ((ChartRange) -> Void)?

    // MARK: - UI

    private let titleLabel = UILabel().configured {
        $0.text = "Динамика"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .white
    }

    private var barChart: some View {
        BarChartComponent(content: []) {
            $0.formatted(.dateTime.weekday(.abbreviated))
        }
    }

    private let dayButton = UIButton(type: .system)
    private let weekButton = UIButton(type: .system)
    private let monthButton = UIButton(type: .system)

    private lazy var buttonsStack = UIStackView(arrangedSubviews: [
        dayButton, weekButton, monthButton
    ]).configured {
        $0.axis = .horizontal
        $0.spacing = 4
        $0.distribution = .fillEqually
        $0.backgroundColor = .darkGray
        $0.layer.cornerRadius = 18
    }

    // MARK: - Bottom metrics

    private let metricsStack = UIStackView().configured {
        $0.axis = .vertical
        $0.spacing = 12
    }

    private let hrvView = RecoveryMetricView()
    private let pulseView = RecoveryMetricView()
    private let breathView = RecoveryMetricView()
    private let sleepView = RecoveryMetricView()

    // MARK: - State

    private var selectedRange: ChartRange = .day {
        didSet { updateButtonsUI() }
    }

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
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
        let hostingBarChartController = UIHostingController(rootView: barChart)
        contentView.addSubview(titleLabel)
        contentView.addSubview(buttonsStack)
        contentView.addSubview(hostingBarChartController.view)
        contentView.addSubview(metricsStack)

        metricsStack.addArrangedSubview(hrvView)
        metricsStack.addArrangedSubview(pulseView)
        metricsStack.addArrangedSubview(breathView)
        metricsStack.addArrangedSubview(sleepView)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        metricsStack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),

            buttonsStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            buttonsStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            buttonsStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            buttonsStack.heightAnchor.constraint(equalToConstant: 36),

            metricsStack.topAnchor.constraint(equalTo: buttonsStack.bottomAnchor, constant: 16),
            metricsStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            metricsStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            metricsStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])

        configureButton(dayButton, title: "День")
        configureButton(weekButton, title: "Неделя")
        configureButton(monthButton, title: "Месяц")
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
        selectedRange = range
        onRangeChanged?(range)
    }

    private func updateButtonsUI() {
        [dayButton, weekButton, monthButton].forEach {
            $0.backgroundColor = .darkGray
        }

        switch selectedRange {
        case .day: dayButton.backgroundColor = .black
        case .week: weekButton.backgroundColor = .black
        case .month: monthButton.backgroundColor = .black
        }
    }

    // MARK: - External config

    func configureChart(data: [HealthInfoDM]) {
        
    }

    func configureMetrics(_ metrics: [RecoveryMetric]) {
        hrvView.configure(metrics[0])
        pulseView.configure(metrics[1])
        breathView.configure(metrics[2])
        sleepView.configure(metrics[3])
    }
}

final class RecoveryMetricView: UIView {

    private let iconView = UIImageView()
    private let titleLabel = UILabel()
    private let valueLabel = UILabel()
    private let trendImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setupUI() {
        iconView.tintColor = .systemGray
        titleLabel.font = .systemFont(ofSize: 13)
        titleLabel.textColor = .systemGray

        valueLabel.font = .systemFont(ofSize: 20, weight: .bold)
        valueLabel.textColor = .white

        trendImageView.contentMode = .scaleAspectFit

        let textStack = UIStackView(arrangedSubviews: [valueLabel, titleLabel])
        textStack.axis = .vertical
        textStack.spacing = 2

        let hStack = UIStackView(arrangedSubviews: [
            iconView,
            textStack,
            UIView(),
            trendImageView
        ])
        hStack.alignment = .center
        hStack.spacing = 8

        addSubview(hStack)
        hStack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: topAnchor),
            hStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor),

            iconView.widthAnchor.constraint(equalToConstant: 20),
            iconView.heightAnchor.constraint(equalToConstant: 20),
            trendImageView.widthAnchor.constraint(equalToConstant: 16),
            trendImageView.heightAnchor.constraint(equalToConstant: 16)
        ])
    }

    func configure(_ model: RecoveryMetric) {
        iconView.image = model.icon
        titleLabel.text = model.title
        valueLabel.text = model.value
        trendImageView.image = model.trendIcon
        trendImageView.tintColor = model.trendColor
    }
}

struct RecoveryMetric {
    let icon: UIImage?
    let title: String
    let value: String
    let trendIcon: UIImage?
    let trendColor: UIColor
}
