//
//  StrainCollectionViewCell.swift
//  HealthTraker
//
//  Created by Ali on 21/12/2025.
//

import UIKit

class StrainCollectionViewCell: UICollectionViewCell {
    private lazy var iconeView = UIImageView().configured { view in
        view.image = UIImage(named: "strain_ic")
    }
    private lazy var titleLabel = UILabel().configured { label in
        label.text = "Strain"
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .medium)
    }
    private lazy var cirlceView = CircleMetricView().configured { view in
        view.style = .solid
        view.subtitle = "из 21"
        view.color = .systemTeal
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
    
    // configure data
    func configureCell(data: HealthInfoDM) {
        cirlceView.title = "\(Int(data.value))%"
        cirlceView.progress = CGFloat(data.value / 21)
    }
}
