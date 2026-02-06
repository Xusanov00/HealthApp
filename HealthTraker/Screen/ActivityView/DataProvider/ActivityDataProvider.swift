//
//  ActivityDataProvider.swift
//  HealthTraker
//
//  Created by Ali on 22/12/2025.
//

import UIKit

protocol ActivityDataProviderDelegate: AnyObject {
    func sleepTapped()
    func recoveryTapped()
    func strainTapped()
}

final class ActivityDataProvider: NSObject {
    var onDateSelected: ((Date) -> Void)?
    var onRangeChanged: ((ChartRange) -> Void)?
    
    var recoveryData: [HealthInfoDM] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    var sleepData: [HealthInfoDM] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    weak var delegate: ActivityDataProviderDelegate?
    
    private let collectionView: UICollectionView
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsMultipleSelection = false
        collectionView.register(SleepCollectionViewCell.self, forCellWithReuseIdentifier: SleepCollectionViewCell.string)
        collectionView.register(RecoveryCollectionViewCell.self, forCellWithReuseIdentifier: RecoveryCollectionViewCell.string)
        collectionView.register(StrainCollectionViewCell.self, forCellWithReuseIdentifier: StrainCollectionViewCell.string)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.string)
    }
}

extension ActivityDataProvider: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SleepCollectionViewCell.string,
                for: indexPath
            ) as? SleepCollectionViewCell else { return UICollectionViewCell() }
            cell.configureCell(data: sleepData)
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RecoveryCollectionViewCell.string,
                for: indexPath
            ) as? RecoveryCollectionViewCell else { return UICollectionViewCell() }
            cell.configureCell(data: self.recoveryData.last!)
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: StrainCollectionViewCell.string,
                for: indexPath
            ) as? StrainCollectionViewCell else { return UICollectionViewCell() }
            cell.configureCell(data: self.recoveryData.last!)
            return cell
        default:
            return collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.string, for: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0: delegate?.sleepTapped()
        case 1: delegate?.recoveryTapped()
        case 2: delegate?.strainTapped()
        default: break
        }
    }
}

extension ActivityDataProvider: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        switch indexPath.row {
        case 0:
            CGSize(width: (UIScreen.main.bounds.width - 26), height: 160)
        case 1, 2:
            CGSize(width: (UIScreen.main.bounds.width - 26) / 2, height: 200)
        default:
            CGSize(width: 0, height: 0)
        }
    }
}
