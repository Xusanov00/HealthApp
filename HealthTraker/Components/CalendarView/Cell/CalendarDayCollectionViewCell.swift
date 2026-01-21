//
//  CalendarDayCollectionViewCell.swift 
//
//  Created by Ali on 19/12/2025.
//

import UIKit

class CalendarDayCollectionViewCell: UICollectionViewCell {
    private var isFutureDay: Bool = false {
        didSet {
            if isFutureDay {
                circleProgressView.isHidden = true
                dayLabel.textColor = .white.withAlphaComponent(0.5)
                weekdayLabel.textColor = .white.withAlphaComponent(0.5)
            } else {
                circleProgressView.isHidden = false
                dayLabel.textColor = .white
                weekdayLabel.textColor = .white
            }
        }
    }
    private let circleProgressView = CircleProgressView().configured { view in
        view.trackStyle = .solid
        view.trackColor = .black.withAlphaComponent(0.2)
        view.lineWidth = 2
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    private let dayLabel = UILabel().configured { label in
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    private let weekdayLabel = UILabel().configured { label in
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    private let formatter = DateFormatter().configured { formatter in
        formatter.locale = Locale(identifier: "ru_RU")
    }
    private let glassView = UIVisualEffectView().configured { glassView in
        glassView.effect = UIBlurEffect(style: .systemMaterial)
    }
    private let glassButton = UIButton().configured { button in
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
        setupDayLabel()
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
        contentView.addSubview(circleProgressView)

        NSLayoutConstraint.activate([
            circleProgressView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            circleProgressView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            circleProgressView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            circleProgressView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
            circleProgressView.widthAnchor.constraint(equalToConstant: 36),
            circleProgressView.heightAnchor.constraint(equalToConstant: 36),
        ])
    }
    
    private func setupDayLabel() {
        contentView.addSubview(dayLabel)
        
        NSLayoutConstraint.activate([
            dayLabel.centerXAnchor.constraint(equalTo: circleProgressView.centerXAnchor),
            dayLabel.centerYAnchor.constraint(equalTo: circleProgressView.centerYAnchor),
        ])
    }

    private func setupWeekdayLabel() {
        contentView.addSubview(weekdayLabel)
        NSLayoutConstraint.activate([
            weekdayLabel.topAnchor.constraint(equalTo: circleProgressView.bottomAnchor, constant: 2),
            weekdayLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -2),
            weekdayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            weekdayLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }

    func configureCell(isFutureDay: Bool = false, data: HealthInfoDM) {
        self.isFutureDay = isFutureDay
        formatter.dateFormat = "dd"
        dayLabel.text = formatter.string(from: data.date)
        circleProgressView.progressColor = UIColor.calculated(for: data.value)
        circleProgressView.progress = data.value/100

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
