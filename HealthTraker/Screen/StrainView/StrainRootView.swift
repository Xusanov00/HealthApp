//
//  StrainRootView.swift
//  HealthTraker
//
//  Created by User on 04/02/26.
//

import UIKit

protocol StrainRootViewDelegate: AnyObject {
    func dismissTapped()
}

class StrainRootView: CleanView {
    // MARK: - Subviews
    private let strainTitleButton = UIButton().configured { button in
        if #available(iOS 26.0, *) {
            button.configuration = .glass()
        } else {
            button.backgroundColor = .white.withAlphaComponent(0.1)
            button.layer.cornerRadius = 22
        }
        button.setTitle("Strain", for: .normal)
        button.setImage(UIImage(named: "strain_ic"), for: .normal)
        button.configuration?.imagePadding = 10
    }
    private let closeButton = UIButton().configured { button in
        button.setImage(UIImage(named: "xmark_ic"), for: .normal)
        button.addTarget(self, action: #selector(dismissTapped), for: .touchUpInside)
        if #available(iOS 26.0, *) {
            button.configuration = .glass()
        } else {
            button.backgroundColor = .white.withAlphaComponent(0.1)
            button.layer.cornerRadius = 22
        }
    }
    weak var tableView: UITableView!

    weak var delegate: StrainRootViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
        setupStrainTitleButton()
        setupCloseButton()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        let topInset = safeAreaInsets.top + 44
        tableView.contentInset.top = topInset
    }
    
    private func setupTableView() {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .black
        tableView.alwaysBounceVertical = true
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80.0
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
        self.tableView = tableView
    }
    
    private func setupStrainTitleButton() {
        strainTitleButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(strainTitleButton)
        NSLayoutConstraint.activate([
            strainTitleButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            strainTitleButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            strainTitleButton.heightAnchor.constraint(equalToConstant: 44),
            strainTitleButton.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    private func setupCloseButton() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            closeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            closeButton.heightAnchor.constraint(equalToConstant: 44),
            closeButton.widthAnchor.constraint(equalToConstant: 44),
        ])
    }
}

extension StrainRootView {
    @objc func dismissTapped() {
        delegate?.dismissTapped()
    }
}
