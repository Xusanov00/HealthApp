//
//  CalendarView.swift
//  HealthTraker
//
//  Created by Ali on 14/12/2025.
//

import UIKit

protocol CalendarViewDelegate {
    func dateChanged(date: Date)
}

class CalendarView: CleanView {
    private weak var calendarCollectionView: UICollectionView!
    var dateArray: [HealthInfoDM] = [] {
        didSet {
            scrollToLastItem()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }
    var delegate: CalendarViewDelegate?
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 40, height: 60)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        collectionView.allowsMultipleSelection = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(
            CalendarDayCollectionViewCell.self,
            forCellWithReuseIdentifier: CalendarDayCollectionViewCell.string
        )
        collectionView.register(SelectableCell.self, forCellWithReuseIdentifier: SelectableCell.string)
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
    
    func scrollToLastItem(animated: Bool = false) {
        DispatchQueue.main.async {
            let lastIndex = self.calendarCollectionView.numberOfItems(inSection: 0) - 1
            guard lastIndex >= 0 else { return }
            
            let indexPath = IndexPath(item: lastIndex, section: 0)
            self.calendarCollectionView.scrollToItem(
                at: indexPath,
                at: .right,
                animated: animated
            )
        }
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
        cell.isSelected = (indexPath.row == dateArray.count-1)
        cell.configureCell(data: dateArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.dateChanged(date: dateArray[indexPath.row].date)
    }
}
