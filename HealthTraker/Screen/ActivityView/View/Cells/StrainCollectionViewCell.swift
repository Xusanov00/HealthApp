//
//  StrainCollectionViewCell.swift
//  HealthTraker
//
//  Created by Ali on 21/12/2025.
//

import UIKit

class StrainCollectionViewCell: UICollectionViewCell {
    private let titleIconLabel = IconLabel().configured { view in
        view.textFont = .montserrat(ofSize: 16, weight: .semibold)
        view.textColor = .white
        view.text = "Strain"
        view.icon = "strain_ic"
        view.iconColor = ColorLibrary.teal
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    private let lineView = UIView().configured { view in
        view.backgroundColor = .white.withAlphaComponent(0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    private let ringBackgroundSlashView = CircleProgressView().configured { circle in
        circle.lineWidth = 10
        circle.progress = 0
        circle.trackColor = .white.withAlphaComponent(0.1)
        circle.trackStyle = .solid
        circle.dashLength = 1.25
        circle.dashSpacing = 2.5
        circle.translatesAutoresizingMaskIntoConstraints = false
    }
    private let ringProgressView = RingProgressView().configured { ring in
        ring.backgroundRingColor = .clear
        ring.ringWidth = 10
        ring.progress = 0
        ring.style = .round
        ring.translatesAutoresizingMaskIntoConstraints = false
    }
    private let ringProgressLabel = UILabel().configured { label in
        label.font = .montserrat(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = .white
    }
    private let ringSubtitleLabel = UILabel().configured { label in
        label.font = .montserrat(ofSize: 12, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = .white
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white.withAlphaComponent(0.1)
        contentView.layer.cornerRadius = 22
        contentView.clipsToBounds = true
        setupTitleIcon()
        setupLineView()
        setupRingView()
        setupRingProgress()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }

    private func setupTitleIcon() {
        contentView.addSubview(titleIconLabel)
        NSLayoutConstraint.activate([
            titleIconLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 10
            ),
            titleIconLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 12
            ),
            titleIconLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -12
            ),
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
    
    private func setupRingView() {
        contentView.addSubview(ringBackgroundSlashView)
        contentView.addSubview(ringProgressView)
        
        NSLayoutConstraint.activate([
            ringBackgroundSlashView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 16),
            ringBackgroundSlashView.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 16),
            ringBackgroundSlashView.trailingAnchor.constraint(greaterThanOrEqualTo: contentView.trailingAnchor, constant: -16),
            ringBackgroundSlashView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            ringBackgroundSlashView.widthAnchor.constraint(equalToConstant: 120),
            ringBackgroundSlashView.heightAnchor.constraint(equalToConstant: 120),
            ringBackgroundSlashView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            ringProgressView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 16),
            ringProgressView.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 16),
            ringProgressView.trailingAnchor.constraint(greaterThanOrEqualTo: contentView.trailingAnchor,constant: -16),
            ringProgressView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            ringProgressView.widthAnchor.constraint(equalToConstant: 120),
            ringProgressView.heightAnchor.constraint(equalToConstant: 120),
            ringProgressView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func setupRingProgress() {
        let stackView = UIStackView(arrangedSubviews: [ringProgressLabel, ringSubtitleLabel]).configured { stack in
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.axis = .vertical
            stack.distribution = .fill
            stack.alignment = .center
        }
        
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(greaterThanOrEqualTo: ringProgressView.centerXAnchor),
            stackView.centerYAnchor.constraint(greaterThanOrEqualTo: ringProgressView.centerYAnchor),
        ])
    }
    
    // circle subtitle string
    private func recoveryStatus(_ value: Double) -> String {
        switch value {
        case 0..<34:
            return "низкое"
        case 34..<67:
            return "нормальное"
        case 67..<101:
            return "отличное"
        default:
            return "непонятное"
        }
    }
    
    // configure data
    func configureCell(data: HealthInfoDM) {
        ringProgressView.progress = CGFloat(data.value / 100)
        ringProgressLabel.text = "\(data.value)"
        ringSubtitleLabel.text = recoveryStatus(data.value)
    }
}


