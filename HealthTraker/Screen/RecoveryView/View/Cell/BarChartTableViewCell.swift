//
//  BarChartTableViewCell.swift
//  HealthTraker
//
//  Created by Ali on 21/12/2025.
//

import SwiftUI
import UIKit

class BarChartTableViewCell: UITableViewCell {
    @Published private var recoveryData: [HealthInfoDM] = []
    private let chartViewModel = BarChartViewModel()
    private let backView = UIView().configured { view in
        view.backgroundColor = ColorLibrary.white
        view.layer.cornerRadius = 22
        view.alpha = 0.1
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    private let titleIconLabel = IconLabel().configured { view in
        view.textFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.textColor = ColorLibrary.white
        view.iconColor = ColorLibrary.white.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var hostingBarChart = UIHostingController(
        rootView: BarChartComponent(viewModel: chartViewModel)
    )
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = ColorLibrary.backgroundBlack
        setupUI()
        initUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
    
    private func setupUI() {
        hostingBarChart.sizingOptions = [.intrinsicContentSize]
        hostingBarChart.view.backgroundColor = .clear
        hostingBarChart.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func initUI() {
        contentView.addSubview(backView)
        contentView.addSubview(titleIconLabel)
        contentView.addSubview(hostingBarChart.view)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
        ])
        
        NSLayoutConstraint.activate([
            titleIconLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
            titleIconLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16),
            titleIconLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            hostingBarChart.view.topAnchor.constraint(equalTo: titleIconLabel.topAnchor, constant: 46),
            hostingBarChart.view.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            hostingBarChart.view.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            hostingBarChart.view.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            hostingBarChart.view.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func configureCell(
        icon: String,
        title: String,
        yValues: [Double],
        data: [HealthInfoDM]
    ) {
        titleIconLabel.icon = icon
        titleIconLabel.text = title
        chartViewModel.data = data
        chartViewModel.yValues = yValues
        chartViewModel.showPointValues = true
        chartViewModel.isPercentage = true
    }
}

