//
//  SleepAdviceCollectionViewCell.swift
//  HealthTraker
//
//  Created by User on 11/02/26.
//

import UIKit

class SleepAdviceCollectionViewCell: UICollectionViewCell {
    struct AdviceCVCModel {
        let image: String
        let title: String
        let subtitle: String
    }
    
    private let backImage = UIImageView().configured { image in
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
    }
    private let titleLabel = UILabel().configured { label in
        label.numberOfLines = 1
        label.font = .montserrat(ofSize: 15, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    private let subtitleLabel = UILabel().configured { label in
        label.numberOfLines = 2
        label.font = .montserrat(ofSize: 13, weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    let blurView = UIVisualEffectView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 16
        contentView.clipsToBounds = true
        setupBackImage()
        setupBlurView()
        setupSubtitleLabel()
        setupTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        blurView.layer.mask?.frame = blurView.bounds
    }
    
    private func setupBackImage() {
        contentView.addSubview(backImage)
        
        NSLayoutConstraint.activate([
            backImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            backImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    private func setupSubtitleLabel() {
        contentView.addSubview(subtitleLabel)
        
        NSLayoutConstraint.activate([
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }
    
    private func setupTitleLabel() {
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -16),
        ])
    }
    
    private func setupBlurView() {
        let blurEffect = UIBlurEffect(style: .systemMaterialDark)
        blurView.effect = blurEffect
        blurView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(blurView)

        NSLayoutConstraint.activate([
            blurView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            blurView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        let maskLayer = CAGradientLayer()
        maskLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.white.cgColor
        ]
        maskLayer.locations = [0.0, 1.0]
        maskLayer.frame = blurView.bounds

        blurView.layer.mask = maskLayer
    }
    
    func configureCell(data: AdviceCVCModel) {
        backImage.image = UIImage(named: data.image)
        titleLabel.text = data.title
        subtitleLabel.text = data.subtitle
    }
}
