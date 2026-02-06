//
//  SleepCollectionViewCell.swift
//  HealthTraker
//
//  Created by User on 04/02/26.
//

import UIKit

class SleepCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Constants
    private enum Constants {
        static let barsCount: Int = 7
        static let barWidth: CGFloat = 12
        static let barMaxHeight: CGFloat = 60
        static let spacing: CGFloat = 8
        static let barToLabelSpacing: CGFloat = 2
    }
    
    private var backgroundBars: [UIView] = []
    private var valueBars: [UIView] = []
    
    // MARK: - UI Elements
    private let titleIconLabel = IconLabel().configured { view in
        view.textFont = .montserrat(ofSize: 16, weight: .semibold)
        view.textColor = .white
        view.text = "Сон"
        view.icon = "recovery_ic"
        view.iconColor = ColorLibrary.teal
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let chevronIcon = UIImageView().configured { icon in
        icon.image = UIImage(systemName: "chevron.right")
        icon.contentMode = .scaleAspectFit
        icon.tintColor = ColorLibrary.lightGreen
        icon.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let lineView = UIView().configured { view in
        view.backgroundColor = .white.withAlphaComponent(0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // Left side labels
    private let sleepTitleLabel = UILabel().configured { label in
        label.text = "время сна"
        label.font = .montserrat(ofSize: 12, weight: .regular)
        label.textColor = .white.withAlphaComponent(0.6)
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let sleepTimeLabel = UILabel().configured { label in
        label.text = "0:00"
        label.font = .montserrat(ofSize: 40, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let avgSleepLabel = UILabel().configured { label in
        label.text = "среднее время: 0ч 0м"
        label.font = .montserrat(ofSize: 12, weight: .regular)
        label.textColor = .white.withAlphaComponent(0.6)
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // Chart container
    private let chartContainerView = UIView().configured { view in
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // Bar views and day labels
    private var barViews: [UIView] = []
    private var dayLabels: [UILabel] = []
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white.withAlphaComponent(0.1)
        contentView.layer.cornerRadius = 22
        contentView.clipsToBounds = true
        setupTitleIcon()
        setupLineView()
        setupLeftLabels()
        setupChart()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
    
    // MARK: - Setup
    private func setupTitleIcon() {
        contentView.addSubview(titleIconLabel)
        contentView.addSubview(chevronIcon)
        
        NSLayoutConstraint.activate([
            titleIconLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleIconLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleIconLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -48),
            
            chevronIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            chevronIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            chevronIcon.heightAnchor.constraint(equalToConstant: 24),
            chevronIcon.widthAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    private func setupLineView() {
        contentView.addSubview(lineView)
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: titleIconLabel.bottomAnchor, constant: 9),
            lineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    private func setupLeftLabels() {
        contentView.addSubview(sleepTitleLabel)
        contentView.addSubview(sleepTimeLabel)
        contentView.addSubview(avgSleepLabel)
        
        NSLayoutConstraint.activate([
            sleepTitleLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 12),
            sleepTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            sleepTimeLabel.topAnchor.constraint(equalTo: sleepTitleLabel.bottomAnchor, constant: 4),
            sleepTimeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            avgSleepLabel.topAnchor.constraint(equalTo: sleepTimeLabel.bottomAnchor, constant: 4),
            avgSleepLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
        ])
    }
    
    private func setupChart() {
        contentView.addSubview(chartContainerView)

        NSLayoutConstraint.activate([
            chartContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            chartContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            chartContainerView.heightAnchor.constraint(equalToConstant: Constants.barMaxHeight + 16),
            chartContainerView.widthAnchor.constraint(
                equalToConstant: CGFloat(Constants.barsCount) * Constants.barWidth +
                                 CGFloat(Constants.barsCount - 1) * Constants.spacing
            )
        ])

        for i in 0..<Constants.barsCount {
            let xOffset = CGFloat(i) * (Constants.barWidth + Constants.spacing)

            // MAX BACKGROUND BAR
            let backgroundBar = UIView()
            backgroundBar.backgroundColor = .white.withAlphaComponent(0.15)
            backgroundBar.layer.cornerRadius = Constants.barWidth / 2
            backgroundBar.translatesAutoresizingMaskIntoConstraints = false
            chartContainerView.addSubview(backgroundBar)

            // VALUE BAR
            let valueBar = UIView()
            valueBar.backgroundColor = ColorLibrary.teal
            valueBar.layer.cornerRadius = Constants.barWidth / 2
            valueBar.translatesAutoresizingMaskIntoConstraints = false
            chartContainerView.addSubview(valueBar)

            // DAY LABEL
            let dayLabel = UILabel()
            dayLabel.font = .montserrat(ofSize: 10, weight: .medium)
            dayLabel.textColor = .white.withAlphaComponent(0.5)
            dayLabel.textAlignment = .center
            dayLabel.translatesAutoresizingMaskIntoConstraints = false
            chartContainerView.addSubview(dayLabel)

            NSLayoutConstraint.activate([
                backgroundBar.leadingAnchor.constraint(equalTo: chartContainerView.leadingAnchor, constant: xOffset),
                backgroundBar.bottomAnchor.constraint(equalTo: chartContainerView.bottomAnchor, constant: -14),
                backgroundBar.widthAnchor.constraint(equalToConstant: Constants.barWidth),
                backgroundBar.heightAnchor.constraint(equalToConstant: Constants.barMaxHeight),

                valueBar.leadingAnchor.constraint(equalTo: backgroundBar.leadingAnchor),
                valueBar.bottomAnchor.constraint(equalTo: backgroundBar.bottomAnchor),
                valueBar.widthAnchor.constraint(equalToConstant: Constants.barWidth),
                valueBar.heightAnchor.constraint(equalToConstant: 0), // будет обновляться

                dayLabel.centerXAnchor.constraint(equalTo: backgroundBar.centerXAnchor),
                dayLabel.topAnchor.constraint(equalTo: backgroundBar.bottomAnchor, constant: Constants.barToLabelSpacing)
            ])

            backgroundBars.append(backgroundBar)
            valueBars.append(valueBar)
            dayLabels.append(dayLabel)
        }
    }
    
    // MARK: - Configure
    func configureCell(data: [HealthInfoDM]) {
        guard
            data.count == Constants.barsCount,
            valueBars.count == Constants.barsCount,
            dayLabels.count == Constants.barsCount
        else {
            return
        }
        
        let maxValue = data.map(\.value).max() ?? 1

        for index in 0..<Constants.barsCount {
            let item = data[index]
            let ratio = CGFloat(item.value / maxValue)
            let barHeight = Constants.barMaxHeight * ratio

            valueBars[index]
                .constraints
                .first { $0.firstAttribute == .height }?
                .constant = barHeight

            if item.isToday {
                valueBars[index].backgroundColor = ColorLibrary.teal
                dayLabels[index].textColor = .white
            } else {
                valueBars[index].backgroundColor = ColorLibrary.teal.withAlphaComponent(0.3)
                dayLabels[index].textColor = .white.withAlphaComponent(0.3)
            }

            dayLabels[index].text = item.date.chartLabel(for: .day)
        }
        layoutIfNeeded()
    }
}
