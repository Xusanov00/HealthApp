//
//  SleepAdviceTableViewCell.swift
//  HealthTraker
//
//  Created by User on 04/02/26.
//

import UIKit

class SleepAdviceTableViewCell: UITableViewCell {
    private weak var adviceCollView: UICollectionView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        layout.itemSize = CGSize(width: 330, height: 210)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8)
        collectionView.allowsMultipleSelection = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(
            SleepAdviceCollectionViewCell.self,
            forCellWithReuseIdentifier: SleepAdviceCollectionViewCell.string
        )
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 280)
        ])
        self.adviceCollView = collectionView
    }
    
}

extension SleepAdviceTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SleepAdviceCollectionViewCell.string, for: indexPath) as? SleepAdviceCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(
            data: .init(
                image: "manCat_back",
                title: "Фазы сна: какие они бывают",
                subtitle: "Смена фаз — повторяемый процесс, который называется циклом сна"
            )
        )
        return cell
    }
    
    
}
