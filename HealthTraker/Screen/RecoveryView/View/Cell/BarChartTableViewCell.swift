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
        view.backgroundColor = ColorLibrary.gray1
        view.layer.cornerRadius = 22
    }
    private let titleIcon = UIImageView().configured { image in
        image.contentMode = .scaleAspectFit
    }
    private let titleLabel = UILabel().configured { label in
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = ColorLibrary.white
    }
    private lazy var titleStack = UIStackView(arrangedSubviews: [titleIcon, titleLabel]).configured { stack in
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 16
    }
    
    private lazy var hostingBarChart = UIHostingController(
        rootView: BarChartComponent(viewModel: chartViewModel)
    )
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupUI()
        initUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
    
    private func setupUI() {
        hostingBarChart.view.backgroundColor = .clear
        backView.translatesAutoresizingMaskIntoConstraints = false
        titleIcon.translatesAutoresizingMaskIntoConstraints = false
        titleStack.translatesAutoresizingMaskIntoConstraints = false
        hostingBarChart.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func initUI() {
        contentView.addSubview(backView)
        backView.addSubview(titleStack)
        backView.addSubview(hostingBarChart.view)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
        ])
        
        NSLayoutConstraint.activate([
            titleIcon.heightAnchor.constraint(equalToConstant: 24),
            titleIcon.widthAnchor.constraint(equalToConstant: 24),
        ])
        
        NSLayoutConstraint.activate([
            titleStack.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
            titleStack.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16),
            titleStack.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            hostingBarChart.view.topAnchor.constraint(equalTo: titleStack.topAnchor, constant: 46),
            hostingBarChart.view.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            hostingBarChart.view.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            hostingBarChart.view.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16),
            hostingBarChart.view.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureCell(
        icon: String,
        title: String,
        yValues: [Double],
        data: [HealthInfoDM]
    ) {
        titleIcon.image = UIImage(named: icon)
        titleLabel.text = title
        chartViewModel.data = data
        chartViewModel.yValues = yValues
        chartViewModel.showPointValues = true
    }
}

