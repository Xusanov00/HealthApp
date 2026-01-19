//
//  SelectableCell.swift
//  HealthTraker
//
//  Created by User on 12/01/26.
//

import UIKit

final class SelectableCell: UICollectionViewCell {

    private let glassView = UIVisualEffectView().configured { glassView in
        glassView.effect = UIBlurEffect(style: .systemMaterial)
    }
    
    private var glassButton = UIButton().configured { button in
        if #available(iOS 26.0, *) {
            button.configuration = .glass()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setup() {
        contentView.layer.cornerRadius = 16
        contentView.clipsToBounds = true
        setupLiquidGlassBackground()
    }

    private func setupLiquidGlassBackground() {
        if #available(iOS 26.0, *) {
            glassButton.alpha = 1
            glassButton.isUserInteractionEnabled = false
            glassButton.translatesAutoresizingMaskIntoConstraints = false
            addSubview(glassButton)
            
            NSLayoutConstraint.activate([
                glassButton.topAnchor.constraint(equalTo: contentView.topAnchor),
                glassButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                glassButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                glassButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                glassButton.widthAnchor.constraint(equalToConstant: 20),
                glassButton.heightAnchor.constraint(equalToConstant: 50),
            ])
        } else {
            glassView.alpha = 0
            glassView.isUserInteractionEnabled = false
            glassView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(glassView)
            
            NSLayoutConstraint.activate([
                glassView.topAnchor.constraint(equalTo: contentView.topAnchor),
                glassView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                glassView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                glassView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                glassView.widthAnchor.constraint(equalToConstant: 50),
                glassView.heightAnchor.constraint(equalToConstant: 100),
            ])
        }
    }
    
    override var isSelected: Bool {
        didSet {
            updateSelection(animated: true)
        }
    }

    private func updateSelection(animated: Bool) {
        let changes = {
            if #available(iOS 26.0, *) {
                self.glassButton.alpha = self.isSelected ? 1 : 0
            } else {
                self.glassView.alpha = self.isSelected ? 0.7 : 0
            }
        }

        animated
        ? UIView.animate(withDuration: 0.25, animations: changes)
        : changes()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        if #available(iOS 26.0, *) {
            glassButton.alpha = 0
        }else {
            glassView.alpha = 0
        }
    }
}
