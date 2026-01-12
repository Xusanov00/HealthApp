//
//  CalendarView.swift
//  HealthTraker
//
//  Created by Ali on 14/12/2025.
//

import UIKit

class CalendarView: CleanView {
    private weak var calendarCollectionView: UICollectionView!
    var dateArray: [HealthInfoDM] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 40, height: 56)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.allowsSelection = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(
            CalendarDayCollectionViewCell.self,
            forCellWithReuseIdentifier: CalendarDayCollectionViewCell.string
        )
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        self.calendarCollectionView = collectionView
    }
}

extension CalendarView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dateArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(
			withReuseIdentifier: CalendarDayCollectionViewCell.string,
			for: indexPath
		) as? CalendarDayCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(data: dateArray[indexPath.row])
        return cell
    }
}
