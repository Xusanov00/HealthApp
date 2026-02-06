//
//  SleepMetricView.swift
//  HealthTraker
//
//  Created by User on 19/01/26.
//

import UIKit

// MARK: - Sleep Daily Metric view
struct SleepMetric {
    let data: [HealthInfoDM]
    let icon: String
    let subtitle: String
    var inPercent: Bool = false
}

final class SleepMetricView: CleanView {
    // UI
    let stackView = UIStackView().configured { stack in
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .fill
    }
    private let leftIconLabel = IconLabel().configured { view in
        view.textFont = .montserrat(ofSize: 20, weight: .bold)
        view.textColor = .white
        view.iconColor = .white.withAlphaComponent(0.5)
    }
    private let rightIconLabel = IconLabel().configured { view in
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textFont = .montserrat(ofSize: 16, weight: .bold)
        view.textColor = .white.withAlphaComponent(0.5)
        view.iconColor = .white.withAlphaComponent(0.5)
    }
    private let subtitleLabel = UILabel().configured { label in
        label.numberOfLines = 1
        label.font = .montserrat(ofSize: 12, weight: .medium)
        label.textColor = .white.withAlphaComponent(0.5)
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    private func setupUI() {
        addSubview(stackView)
        addSubview(subtitleLabel)
        stackView.addArrangedSubview(leftIconLabel)
        stackView.addArrangedSubview(rightIconLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            rightIconLabel.widthAnchor.constraint(equalToConstant: 80),
            
            subtitleLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 2),
            subtitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }

    func configureView(_ model: SleepMetric) {
        leftIconLabel.icon = model.icon
        subtitleLabel.text = model.subtitle
        
        leftIconLabel.text = calculateValues(model.data).current.value.valueFormatter(inPercent: model.inPercent)
        rightIconLabel.text = calculateValues(model.data).previous.value.valueFormatter(inPercent: model.inPercent)
        
        if  calculateValues(model.data).current.value > calculateValues(model.data).previous.value {
            rightIconLabel.icon = "chevron_up"
            rightIconLabel.iconColor = ColorLibrary.lightGreen
        } else if  calculateValues(model.data).current.value < calculateValues(model.data).previous.value {
            rightIconLabel.icon = "chevron_down"
            rightIconLabel.iconColor = ColorLibrary.yellow
        } else {
            rightIconLabel.icon = ""
        }
    }
    
    private func calculateValues(_ data: [HealthInfoDM]) -> (previous: HealthInfoDM, current: HealthInfoDM) {
        let current = data.last ?? HealthInfoDM(date: Date(), value: 0, label: "")
        var previous: HealthInfoDM
        if data.count > 1 {
            previous = data[data.count-2]
        } else {
            previous = HealthInfoDM(date: Date(), value: 0, label: "")
        }
        return (previous, current)
    }
}
