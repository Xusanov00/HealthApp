//
//  CalendarView.swift
//  HealthTraker
//
//  Created by Ali on 14/12/2025.
//

import UIKit

protocol CalendarViewDelegate: AnyObject {
    func dateChanged(date: Date)
}

class CalendarView: CleanView {
    private weak var calendarCollectionView: UICollectionView!
    
    var dateArray: [HealthInfoDM] = [] {
        didSet {
            calendarCollectionView.reloadData()
        }
    }
    
    var selectedDate: Date? {
        didSet {
            updateSelection()
        }
    }
    
    private var hasScrolledToEnd = false
    
    weak var delegate: CalendarViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.itemSize = CGSize(width: 40, height: 56)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 12, left: 12, bottom: 0, right: 12)
        collectionView.allowsMultipleSelection = false
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
    
    /// Скролл к концу (вызывать один раз при первой загрузке)
    func scrollToEnd(animated: Bool = false) {
        guard !hasScrolledToEnd else { return }
        hasScrolledToEnd = true
        
        DispatchQueue.main.async {
            let count = self.calendarCollectionView.numberOfItems(inSection: 0)
            guard count > 0 else { return }
            
            let lastIndexPath = IndexPath(item: count - 1, section: 0)
            self.calendarCollectionView.scrollToItem(
                at: lastIndexPath,
                at: .right,
                animated: animated
            )
        }
    }
    
    /// Обновляет визуальное выделение на основе selectedDate
    private func updateSelection() {
        guard let selectedDate = selectedDate else { return }
        
        DispatchQueue.main.async {
            // Найти индекс выбранной даты
            guard let index = self.dateArray.firstIndex(where: {
                Calendar.current.isDate($0.date, inSameDayAs: selectedDate)
            }) else { return }
            
            let indexPath = IndexPath(item: index, section: 0)
            
            // Снять выделение со всех и выделить нужную
            self.calendarCollectionView.selectItem(
                at: indexPath,
                animated: false,
                scrollPosition: []
            )
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
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
        
        let data = dateArray[indexPath.row]
        cell.configureCell(data: data)
        
        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        shouldSelectItemAt indexPath: IndexPath
    ) -> Bool {
        return !dateArray[indexPath.row].date.isFuture
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let date = dateArray[indexPath.row].date
        selectedDate = date
        delegate?.dateChanged(date: date)
    }
}
