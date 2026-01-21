//
//  LineChartTableViewCell.swift
//  HealthTraker
//
//  Created by Ali on 21/12/2025.
//

import UIKit
import SwiftUI

class LineChartTableViewCell: UITableViewCell {
    private let chartViewModel = LineChartViewModel()
    private let backView = UIView().configured { view in
        view.backgroundColor = .white
        view.alpha = 0.1
        view.layer.cornerRadius = 22
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    private let titleIconLabel = IconLabel().configured { view in
        view.textFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.textColor = .white
        view.iconColor = .white.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var hostingLineChart = UIHostingController(
        rootView: LineChartComponent(viewModel: chartViewModel)
    )
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        setupHostage()
        initUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
    
    private func setupHostage() {
        hostingLineChart.sizingOptions = [.intrinsicContentSize]
        hostingLineChart.view.backgroundColor = .clear
        hostingLineChart.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func initUI() {
        contentView.addSubview(backView)
        contentView.addSubview(titleIconLabel)
        contentView.addSubview(hostingLineChart.view)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
        ])

        NSLayoutConstraint.activate([
            titleIconLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
            titleIconLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16),
            titleIconLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            hostingLineChart.view.topAnchor.constraint(equalTo: titleIconLabel.topAnchor, constant: 46),
            hostingLineChart.view.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            hostingLineChart.view.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            hostingLineChart.view.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            hostingLineChart.view.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureCell(icon: String, title: String, yValues: [Double], data: [HealthInfoDM]) {
        titleIconLabel.icon = icon
        titleIconLabel.text = title
        chartViewModel.data = data
        chartViewModel.yValues = yValues
        chartViewModel.showPointValues = true
    }
}

