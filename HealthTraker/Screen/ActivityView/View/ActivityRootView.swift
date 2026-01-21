//
//  ActivityRootView.swift
//  HealthTraker
//
//  Created by Ali on 11/12/2025.
//

import UIKit
import SwiftUI

final class ActivityRootView: CleanView, UITableViewDelegate {
    // MARK: - Subviews
    weak var collectionView: UICollectionView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
        backgroundColor = .red
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
        self.collectionView = collectionView
    }
}
