//
//  RecoveryHeaderView.swift
//  HealthTraker
//
//  Created by User on 19/01/26.
//

import UIKit

class RecoveryHeaderView: CleanView {
    private let backView = UIView().configured { view in
        view.layer.cornerRadius = 22
        view.clipsToBounds = true
    }
    private let ringBackgroundSlashView = CircleProgressView().configured { circle in
        circle.lineWidth = 10
        circle.progress = 0
        circle.trackColor = .white.withAlphaComponent(0.1)
        circle.trackStyle = .dashed
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
    private let gradientLayer = CAGradientLayer()
    private let percentLabel = UILabel().configured { label in
        label.font = .systemFont(ofSize: 56, weight: .bold)
        label.numberOfLines = 1
        label.textColor = .white
    }
    private let circleInsideImage = UIImageView().configured { image in
        image.image = UIImage(named: "personBall_ic")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .white
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
    }
    private let descriptionLabel = UILabel().configured { label in
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 2
        label.textColor = .white.withAlphaComponent(0.6)
        label.text = "Готовность вашего\nорганизма к нагрузкам"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackView()
        setupGradient()
        setupRingView()
        setupImageView()
        setupTextView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = backView.bounds
    }
    
    private func setupBackView() {
        addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            backView.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    private func setupGradient() {
        gradientLayer.colors = [
            ColorLibrary.gradientLeft.cgColor,
            ColorLibrary.gradientRight.cgColor
        ]

        gradientLayer.startPoint = CGPoint(x: 0.1, y: 0.9)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)

        gradientLayer.cornerRadius = 22
        backView.layer.insertSublayer(gradientLayer, at: 0)
    }

    private func setupTextView() {
        let stackView = UIStackView(arrangedSubviews: [percentLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        backView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(greaterThanOrEqualTo: backView.topAnchor, constant: 21),
            stackView.leadingAnchor.constraint(equalTo: ringProgressView.trailingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(greaterThanOrEqualTo: backView.bottomAnchor, constant: -21),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupRingView() {
        backView.addSubview(ringBackgroundSlashView)
        backView.addSubview(ringProgressView)
        NSLayoutConstraint.activate([
            ringBackgroundSlashView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 20),
            ringBackgroundSlashView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16),
            ringBackgroundSlashView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -20),
            ringBackgroundSlashView.widthAnchor.constraint(equalToConstant: 100),
            ringBackgroundSlashView.heightAnchor.constraint(equalToConstant: 100),
            
            ringProgressView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 20),
            ringProgressView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16),
            ringProgressView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -20),
            ringProgressView.widthAnchor.constraint(equalToConstant: 100),
            ringProgressView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupImageView() {
        addSubview(circleInsideImage)
        NSLayoutConstraint.activate([
            circleInsideImage.widthAnchor.constraint(equalToConstant: 44),
            circleInsideImage.heightAnchor.constraint(equalToConstant: 44),
            circleInsideImage.centerYAnchor.constraint(equalTo: ringProgressView.centerYAnchor),
            circleInsideImage.centerXAnchor.constraint(equalTo: ringProgressView.centerXAnchor),
        ])
    }
    
    func configureHeader(data: HealthInfoDM?) {
        guard let data else { return }
        percentLabel.text = "\(Int(data.value))%"
        
        ringProgressView.endColor = .calculated(for: data.value)
        ringProgressView.startColor = ringProgressView.endColor
        ringProgressView.progress = data.value/100
    }
}
