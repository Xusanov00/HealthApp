//
//  CalendarDayCollectionViewCell.swift 
//
//  Created by Ali on 19/12/2025.
//

import UIKit

class CalendarDayCollectionViewCell: UICollectionViewCell {

    private let dateCircle = CircleMetricView().configured { view in
        view.style = .solid
    }
    private let weekdayLabel = UILabel()
    private var formatter = DateFormatter().configured { formatter in
        formatter.locale = Locale(identifier: "ru_RU")
    }
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
        contentView.layer.cornerRadius = contentView.frame.width / 2
        contentView.clipsToBounds = true
        setupLiquidGlassBackground()
        setupDateCircle()
        setupWeekdayLabel()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override var isSelected: Bool {
        didSet {
            updateSelection(animated: true)
        }
    }

    private func setupDateCircle() {
        contentView.addSubview(dateCircle)
        dateCircle.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            dateCircle.topAnchor.constraint(equalTo: contentView.topAnchor),
            dateCircle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dateCircle.widthAnchor.constraint(equalToConstant: 44),
            dateCircle.heightAnchor.constraint(equalToConstant: 44),
            dateCircle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dateCircle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }

    private func setupWeekdayLabel() {
        contentView.addSubview(weekdayLabel)
        weekdayLabel.translatesAutoresizingMaskIntoConstraints = false

        weekdayLabel.font = .systemFont(ofSize: 12)
        weekdayLabel.textAlignment = .center
        weekdayLabel.textColor = .white

        NSLayoutConstraint.activate([
            weekdayLabel.topAnchor.constraint(equalTo: dateCircle.bottomAnchor, constant: 4),
            weekdayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            weekdayLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            weekdayLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -4)
        ])
    }

    func configureCell(data: HealthInfoDM) {
        formatter.dateFormat = "dd"
        dateCircle.title = formatter.string(from: data.date)
        dateCircle.color = UIColor.calculated(for: data.value)
        dateCircle.progress = data.value/100

        formatter.dateFormat = "EE"
        weekdayLabel.text = formatter.string(from: data.date)
    }
}

// MARK: - Liquid glass background
extension CalendarDayCollectionViewCell {
    private func setupLiquidGlassBackground() {
        if #available(iOS 26.0, *) {
            glassButton.alpha = 0
            glassButton.isUserInteractionEnabled = false
            glassButton.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(glassButton)
            
            NSLayoutConstraint.activate([
                glassButton.topAnchor.constraint(equalTo: contentView.topAnchor),
                glassButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                glassButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                glassButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ])
        } else {
            glassView.alpha = 0
            glassView.isUserInteractionEnabled = false
            glassView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(glassView)
            
            NSLayoutConstraint.activate([
                glassView.topAnchor.constraint(equalTo: contentView.topAnchor),
                glassView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                glassView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                glassView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ])
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
        ? UIView.animate(withDuration: 0.15, animations: changes)
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
