//
//  SleepStageRowView.swift
//  HealthTraker
//
//  Created by User on 06/02/26.
//

import UIKit

final class SleepStageRowView: UIView {
    private let dotView = UIView().configured { view in
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 4
    }
    private let valueLabel = UILabel().configured { label in
        label.font = .montserrat(ofSize: 20, weight: .bold)
        label.textColor = .white
    }
    private let subtitleLabel = UILabel().configured { label in
        label.font = .montserrat(ofSize: 12, weight: .medium)
        label.textColor = .white.withAlphaComponent(0.5)
        label.numberOfLines = 1
    }
    private let percentLabel = UILabel().configured { label in
        label.font = .montserrat(ofSize: 16, weight: .bold)
        label.textColor = .white.withAlphaComponent(0.5)
        label.textAlignment = .right
    }

    private let topStack = UIStackView().configured { stack in
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 10
    }
    private let contentStack = UIStackView().configured { stack in
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 4
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }

    private func setupUI() {
        addSubview(contentStack)

        topStack.addArrangedSubview(dotView)
        topStack.addArrangedSubview(valueLabel)
        topStack.addArrangedSubview(UIView())
        topStack.addArrangedSubview(percentLabel)

        contentStack.addArrangedSubview(topStack)
        contentStack.addArrangedSubview(subtitleLabel)

        contentStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStack.topAnchor.constraint(equalTo: topAnchor),
            contentStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentStack.bottomAnchor.constraint(equalTo: bottomAnchor),

            dotView.widthAnchor.constraint(equalToConstant: 8),
            dotView.heightAnchor.constraint(equalToConstant: 8)
        ])
    }

    func configure(_ model: SleepStageChartCardModel.StageRow) {
        valueLabel.text = model.valueText
        subtitleLabel.text = model.title
        percentLabel.text = model.percentText
        dotView.backgroundColor = stageColor(model.stage)
    }

    private func stageColor(_ stage: SleepStageChartModel.Stage) -> UIColor {
        switch stage {
        case .awake: return ColorLibrary.red
        case .rem: return ColorLibrary.orange
        case .light: return ColorLibrary.teal
        case .deep: return ColorLibrary.blue
        }
    }
}
