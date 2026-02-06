//
//  IconLabel.swift
//  HealthTraker
//
//  Created by User on 20/01/26.
//

import UIKit

class IconLabel: CleanView {
    // Constants
    var icon: String? {
        didSet {
            guard let icon else {
                iconView.image = nil
                return
            }
            iconView.image = UIImage(named: icon)?
                .withRenderingMode(.alwaysTemplate)
        }
    }
    var text: String? {
        didSet {
            valueLabel.text = text
        }
    }
    var textFont: UIFont? {
        didSet {
            valueLabel.font = textFont
        }
    }
    var iconColor: UIColor? {
        didSet {
            iconView.tintColor = iconColor
        }
    }
    var textColor: UIColor? {
        didSet {
            valueLabel.textColor = textColor
        }
    }
    var spacing: CGFloat = 16 {
        didSet {
            stackView.spacing = spacing
        }
    }
    
    // UI
    private let stackView = UIStackView().configured { stack in
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 16
    }
    private let iconView = UIImageView().configured { image in
        image.contentMode = .scaleAspectFit
    }
    private let valueLabel = UILabel().configured { label in
        label.numberOfLines = 1
        label.font = .montserrat(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        stackView.addArrangedSubview(iconView)
        stackView.addArrangedSubview(valueLabel)
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            iconView.heightAnchor.constraint(equalToConstant: 24),
            iconView.widthAnchor.constraint(equalToConstant: 24),
        ])
    }
}
