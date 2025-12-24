//
//  CalendarTableViewCell.swift
//  HealthTraker
//
//  Created by Ali on 21/12/2025.
//

import UIKit

class CalendarTableViewCell: UITableViewCell {
    private lazy var calendarView = CalendarView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCalendarView()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
    
    private func setupCalendarView() {
        contentView.addSubview(calendarView)
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 12
            ),
            calendarView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            calendarView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),
            calendarView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -12),
            calendarView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func configureCell(data: [HealthInfoDM]) {
        calendarView.dateArray = data
    }
}
