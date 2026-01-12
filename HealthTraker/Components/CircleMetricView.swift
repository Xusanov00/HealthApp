//
//  CircleMetricView.swift
//  HealthTraker
//
//  Created by Ali on 11/12/2025.
//

import UIKit

final class CircleMetricView: CleanView {

    // MARK: - Types

    enum Style {
        case solid
        case doted
    }

    // MARK: - Public API

    var progress: CGFloat = 0 {
        didSet { setNeedsLayout() }
    }

    var color: UIColor = .systemTeal {
        didSet {
            progressLayer.strokeColor = color.cgColor
            subtitleLabel.textColor = color
        }
    }

    var style: Style = .doted {
        didSet { setNeedsLayout() }
    }

    var title: String? {
        didSet {
            titleLabel.text = title
            setNeedsLayout()
        }
    }

    var subtitle: String? {
        didSet {
            subtitleLabel.text = subtitle
            setNeedsLayout()
        }
    }

    var icon: UIImage? {
        didSet {
            imageView.image = icon
            updateContent()
        }
    }

    var stackSpacing: CGFloat = 2 {
        didSet { stackView.spacing = stackSpacing }
    }

    // MARK: - Layers

    private let trackLayer = CAShapeLayer()
    private let progressLayer = CAShapeLayer()
    private let trackMaskLayer = CAShapeLayer()

    // MARK: - UI

    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()

    // MARK: - Constants

    private let lineWidth: CGFloat = 10

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayers()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Setup UI

    private func setupUI() {
        backgroundColor = .clear

        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = stackSpacing

        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white

        titleLabel.font = .boldSystemFont(ofSize: 28)
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontSizeToFitWidth = true
		titleLabel.textColor = ColorLibrary.white

        subtitleLabel.font = .systemFont(ofSize: 12)
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 2

        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
//			stackView.leadingAnchor.constraint(equalTo: leftAnchor, constant: 6),
//			stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 6),
//			stackView.topAnchor.constraint(equalTo: topAnchor, constant: 6),
//			stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 6),
        ])
        updateContent()
    }

    private func setupLayers() {
        trackLayer.fillColor = UIColor.clear.cgColor
		trackLayer.strokeColor = ColorLibrary.backgroundBlack.cgColor
        trackLayer.lineCap = .butt
        trackLayer.mask = trackMaskLayer

        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.strokeColor = color.cgColor

        layer.addSublayer(trackLayer)
        layer.addSublayer(progressLayer)
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayouts()
        updateFonts(for: bounds.size)
    }
    
    private func setupLayouts() {
        let bounds = self.bounds
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = min(bounds.width, bounds.height) / 2 - lineWidth / 2

        let startAngle = -CGFloat.pi / 2
        let endAngle = startAngle + 2 * .pi

        let circlePath = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true
        )

        trackLayer.frame = bounds
        trackLayer.path = circlePath.cgPath
        trackLayer.lineWidth = frame.width / 15

        progressLayer.frame = bounds
        progressLayer.path = circlePath.cgPath
        progressLayer.lineWidth = frame.width / 15
        progressLayer.strokeEnd = max(0, min(progress, 1))

        let maskStart = startAngle + progressLayer.strokeEnd * 2 * .pi
        let maskPath = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: maskStart,
            endAngle: endAngle,
            clockwise: true
        )

        trackMaskLayer.frame = bounds
        trackMaskLayer.path = maskPath.cgPath
        trackMaskLayer.lineWidth = lineWidth
        trackMaskLayer.strokeColor = UIColor.white.cgColor

        applyStyle()
//        updateEndDot(center: center, radius: radius)
    }

    private func updateFonts(for size: CGSize) {
        let base = min(size.width, size.height)

        titleLabel.font = .boldSystemFont(ofSize: base * 0.35)
        subtitleLabel.font = .systemFont(ofSize: base * 0.14)
    }

    // MARK: - Style

    private func applyStyle() {
        switch style {
        case .doted:
            trackLayer.lineDashPattern = [
                NSNumber(value: Float(lineWidth * 0.05)),
                NSNumber(value: Float(lineWidth * 0.2))
            ]

        case .solid:
            trackLayer.lineDashPattern = nil
            trackLayer.isHidden = false
        }
    }

    // MARK: - Content

    private func updateContent() {
        stackView.arrangedSubviews.forEach {
            stackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }

        if let _ = icon {
            stackView.addArrangedSubview(imageView)
        } else {
            stackView.addArrangedSubview(titleLabel)
            stackView.addArrangedSubview(subtitleLabel)
        }
        setNeedsLayout()
    }

    // MARK: - Size

    override var intrinsicContentSize: CGSize {
        CGSize(width: 120, height: 120)
    }
}
