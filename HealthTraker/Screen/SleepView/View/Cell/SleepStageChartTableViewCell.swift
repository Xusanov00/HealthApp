//
//  SleepStageChartTableViewCell.swift
//  HealthTraker
//
//  Created by User on 06/02/26.
//

import UIKit
import SwiftUI

protocol SleepStageChartTableViewCellDelegate: AnyObject {
    func sleepStageInfoTapped()
}

final class SleepStageChartTableViewCell: UITableViewCell {
    private let chartViewModel = SleepStageChartViewModel()

    private let backView = UIView().configured { view in
        view.backgroundColor = .white.withAlphaComponent(0.08)
        view.layer.cornerRadius = 22
        view.clipsToBounds = true
    }

    private let avgTitleLabel = UILabel().configured { label in
        label.font = .montserrat(ofSize: 12, weight: .medium)
        label.textColor = .white.withAlphaComponent(0.5)
        label.text = "среднее время сна"
    }
    private let avgValueLabel = UILabel().configured { label in
        label.font = .montserrat(ofSize: 36, weight: .bold)
        label.textColor = ColorLibrary.darkGreen
        label.text = "0:00"
    }

    private let needTitleLabel = UILabel().configured { label in
        label.font = .montserrat(ofSize: 12, weight: .medium)
        label.textColor = .white.withAlphaComponent(0.5)
        label.text = "норма сна"
    }
    private let needValueLabel = UILabel().configured { label in
        label.font = .montserrat(ofSize: 36, weight: .bold)
        label.textColor = .white
        label.text = "0:00"
        label.textAlignment = .right
    }

    private lazy var hostingChart = UIHostingController(
        rootView: SleepStageChartComponent(viewModel: chartViewModel)
    )

    private let stageTitleLabel = UILabel().configured { label in
        label.font = .montserrat(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.text = "Стадии сна"
    }

    private let infoButton = UIButton(type: .system).configured { button in
        button.setTitle("i", for: .normal)
        button.setTitleColor(ColorLibrary.teal, for: .normal)
        button.titleLabel?.font = .montserrat(ofSize: 12, weight: .bold)
        button.layer.borderWidth = 1
        button.layer.borderColor = ColorLibrary.teal.cgColor
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(infoTapped), for: .touchUpInside)
    }

    private let headerStack = UIStackView().configured { stack in
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 12
    }

    private let avgStack = UIStackView().configured { stack in
        stack.axis = .vertical
        stack.spacing = 6
        stack.alignment = .leading
    }

    private let needStack = UIStackView().configured { stack in
        stack.axis = .vertical
        stack.spacing = 6
        stack.alignment = .trailing
    }

    private let stageHeaderStack = UIStackView().configured { stack in
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
    }

    private let stagesStack = UIStackView().configured { stack in
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 14
    }
    
    weak var delegate: SleepStageChartTableViewCellDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        selectionStyle = .none
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }

    private func setupUI() {
        hostingChart.view.backgroundColor = .clear
        hostingChart.view.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(backView)
        backView.addSubview(headerStack)
        backView.addSubview(hostingChart.view)
        backView.addSubview(stageHeaderStack)
        backView.addSubview(stagesStack)

        avgStack.addArrangedSubview(avgTitleLabel)
        avgStack.addArrangedSubview(avgValueLabel)

        needStack.addArrangedSubview(needTitleLabel)
        needStack.addArrangedSubview(needValueLabel)

        headerStack.addArrangedSubview(avgStack)
        headerStack.addArrangedSubview(needStack)

        stageHeaderStack.addArrangedSubview(stageTitleLabel)
        stageHeaderStack.addArrangedSubview(infoButton)

        backView.translatesAutoresizingMaskIntoConstraints = false
        headerStack.translatesAutoresizingMaskIntoConstraints = false
        stageHeaderStack.translatesAutoresizingMaskIntoConstraints = false
        stagesStack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),

            headerStack.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
            headerStack.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16),
            headerStack.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16),

            hostingChart.view.topAnchor.constraint(equalTo: headerStack.bottomAnchor, constant: 12),
            hostingChart.view.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            hostingChart.view.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            hostingChart.view.heightAnchor.constraint(equalToConstant: 220),

            stageHeaderStack.topAnchor.constraint(equalTo: hostingChart.view.bottomAnchor, constant: 16),
            stageHeaderStack.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16),
            stageHeaderStack.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16),

            infoButton.widthAnchor.constraint(equalToConstant: 20),
            infoButton.heightAnchor.constraint(equalToConstant: 20),

            stagesStack.topAnchor.constraint(equalTo: stageHeaderStack.bottomAnchor, constant: 16),
            stagesStack.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16),
            stagesStack.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16),
            stagesStack.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16)
        ])
    }

    func configure(_ model: SleepStageChartCardModel) {
        avgValueLabel.text = model.averageSleepText
        needValueLabel.text = model.sleepNeedText
        chartViewModel.setData(model.chartModel)

        stagesStack.arrangedSubviews.forEach { view in
            stagesStack.removeArrangedSubview(view)
            view.removeFromSuperview()
        }

        model.stages.forEach { stage in
            let row = SleepStageRowView()
            row.configure(stage)
            stagesStack.addArrangedSubview(row)
        }
    }
}

extension SleepStageChartTableViewCell {
    
    @objc func infoTapped() {
        delegate?.sleepStageInfoTapped()
    }
}
