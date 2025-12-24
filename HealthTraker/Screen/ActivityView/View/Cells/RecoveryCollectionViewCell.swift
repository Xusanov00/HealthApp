//
//  ActivityCollectionViewCell.swift
//  HealthTraker
//
//  Created by Ali on 21/12/2025.
//

import UIKit

class RecoveryCollectionViewCell: UICollectionViewCell {
    private lazy var iconeView = UIImageView().configured { view in
        view.image = UIImage(named: "recovery_ic")
    }
    private lazy var titleLabel = UILabel().configured { label in
        label.text = "Восстановление"
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .medium)
    }
    private lazy var cirlceView = CircleMetricView().configured { view in
        view.style = .doted
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }

    private func setupConstraints() {
        // title
        iconeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconeView.widthAnchor.constraint(
                equalToConstant: 24
            ),
            iconeView.heightAnchor.constraint(
                equalToConstant: 24
            )
        ])

        let stackView = UIStackView(arrangedSubviews: [iconeView, titleLabel])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.distribution = .fill
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 10
            ),
            stackView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 12
            ),
            stackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: 12
            ),
        ])
        
        // cirlce
        contentView.addSubview(cirlceView)
        cirlceView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cirlceView.topAnchor.constraint(
                equalTo: stackView.bottomAnchor,
                constant: 16
            ),
            cirlceView.leadingAnchor.constraint(
                greaterThanOrEqualTo: contentView.leadingAnchor,
                constant: 16
            ),
            cirlceView.trailingAnchor.constraint(
                greaterThanOrEqualTo: contentView.trailingAnchor,
                constant: 16
            ),
            cirlceView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: 16
            ),
            cirlceView.widthAnchor.constraint(equalToConstant: 120),
            cirlceView.heightAnchor.constraint(equalToConstant: 120),
            cirlceView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
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
        cirlceView.color = UIColor.calculated(for: data.value)
        cirlceView.title = "\(Int(data.value))%"
        cirlceView.progress = CGFloat(data.value / 100)
        cirlceView.subtitle = recoveryStatus(data.value)
    }
}
