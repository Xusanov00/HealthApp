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

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDateCircle()
        setupWeekdayLabel()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setupDateCircle() {
        contentView.addSubview(dateCircle)
        dateCircle.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            dateCircle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            dateCircle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dateCircle.widthAnchor.constraint(equalToConstant: 36),
            dateCircle.heightAnchor.constraint(equalToConstant: 36)
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
            weekdayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            weekdayLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
            weekdayLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -2)
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
