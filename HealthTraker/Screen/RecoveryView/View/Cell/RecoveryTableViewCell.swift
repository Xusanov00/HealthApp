//
//  RecoveryTableViewCell.swift
//  HealthTraker
//
//  Created by Ali on 21/12/2025.
//

import UIKit

class RecoveryTableViewCell: UITableViewCell {
    private var backView = UIView().configured { view in
        view.layer.cornerRadius = 22
        view.backgroundColor = .systemIndigo
    }
    private var recoveryCircleView = CircleMetricView().configured { view in
        view.style = .doted
        view.icon = UIImage(named: "personBall_ic")
    }
    private var percentLabel = UILabel().configured { label in
        label.font = .systemFont(ofSize: 56, weight: .bold)
        label.numberOfLines = 1
        label.textColor = .white
    }
    private var descriptionLabel = UILabel().configured { label in
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 2
        label.textColor = .systemGray5
        label.text = "Готовность вашего\nорганизма к нагрузкам"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupBackView()
        setupRecoveryCircle()
        setupTextView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
    
    private func setupBackView() {
        contentView.addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 4
            ),
            backView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 8
            ),
            backView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -4
            ),
            backView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -4
            ),
        ])
    }
    
    private func setupRecoveryCircle() {
        backView.addSubview(recoveryCircleView)
        recoveryCircleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            recoveryCircleView.topAnchor.constraint(
                equalTo: backView.topAnchor,
                constant: 20
            ),
            recoveryCircleView.leadingAnchor.constraint(
                equalTo: backView.leadingAnchor,
                constant: 16
            ),
            recoveryCircleView.bottomAnchor.constraint(
                equalTo: backView.bottomAnchor,
                constant: -20
            ),
            recoveryCircleView.widthAnchor.constraint(
                equalToConstant: 100
            ),
            recoveryCircleView.heightAnchor.constraint(
                equalToConstant: 100
            )
        ])
    }
    
    private func setupTextView() {
        let stackView = UIStackView(arrangedSubviews: [percentLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        backView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(
                greaterThanOrEqualTo: backView.topAnchor,
                constant: 20
            ),
            stackView.leadingAnchor.constraint(
                equalTo: recoveryCircleView.trailingAnchor,
                constant: 24
            ),
            stackView.trailingAnchor.constraint(
                equalTo: backView.trailingAnchor,
                constant: -16
            ),
            stackView.bottomAnchor.constraint(
                greaterThanOrEqualTo: backView.bottomAnchor,
                constant: -20
            ),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configureCell(data: HealthInfoDM) {
        recoveryCircleView.progress = data.value/100
        percentLabel.text = "\(data.value)%"
        recoveryCircleView.color = UIColor.calculated(for: data.value)
        recoveryCircleView.progress = 0.32
    }
}
