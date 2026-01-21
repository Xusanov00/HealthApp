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
        didSet {
            let clamped = max(0, min(progress, 1))
            progressLayer.strokeEnd = clamped
            updateMask()
            updateEndShadow()
        }
    }

    var showsEndShadow: Bool = false {
        didSet {
            endShadowLayer.isHidden = !showsEndShadow
        }
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
    var lineWidth: CGFloat = 10 {
        didSet {
            
        }
    }

    var stackSpacing: CGFloat = 2 {
        didSet { stackView.spacing = stackSpacing }
    }

    // MARK: - Layers
    private let trackLayer = CAShapeLayer()
    private let progressLayer = CAShapeLayer()
    private let trackMaskLayer = CAShapeLayer()
    private let endShadowLayer = CAShapeLayer()
    // MARK: - UI
    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()

    // MARK: - Constants
    private var circleCenter: CGPoint = .zero
    private var circleRadius: CGFloat = 0
    private let startAngle = -CGFloat.pi / 2

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
        ])
        updateContent()
    }

    private func setupLayers() {
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = ColorLibrary.white.withAlphaComponent(0.2).cgColor
        trackLayer.lineCap = .butt
        trackLayer.mask = nil

        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.strokeColor = color.cgColor
        
        endShadowLayer.fillColor = UIColor.clear.cgColor
        endShadowLayer.backgroundColor = color.cgColor
        endShadowLayer.shadowColor = UIColor.black.cgColor
        endShadowLayer.shadowOpacity = 0.35
        endShadowLayer.shadowRadius = 6
//        endShadowLayer.shadowOffset = .zero
        
        endShadowLayer.zPosition = 2
        progressLayer.zPosition = 1
        trackLayer.zPosition = 0

        layer.addSublayer(trackLayer)
        layer.addSublayer(progressLayer)
        layer.addSublayer(endShadowLayer)
    }

    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayouts()
        updateFonts(for: bounds.size)
        updateEndShadow()
    }
    
    private func setupLayouts() {
        let bounds = self.bounds
        circleCenter = CGPoint(x: bounds.midX, y: bounds.midY)
        circleRadius = min(bounds.width, bounds.height) / 2 - lineWidth / 2

        let endAngle = startAngle + 2 * .pi

        let circlePath = UIBezierPath(
            arcCenter: circleCenter,
            radius: circleRadius,
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

        updateMask()
        applyStyle()
    }

    private func updateEndShadow() {
        guard showsEndShadow else { return }

        let angle = startAngle + progressLayer.strokeEnd * 2 * .pi
        let r = circleRadius

        let endPoint = CGPoint(
            x: circleCenter.x + r * cos(angle),
            y: circleCenter.y + r * sin(angle)
        )

        let capRadius = progressLayer.lineWidth / 2

        let path = UIBezierPath(
            ovalIn: CGRect(
                x: endPoint.x - capRadius,
                y: endPoint.y - capRadius,
                width: capRadius * 2,
                height: capRadius * 2
            )
        )

        endShadowLayer.path = path.cgPath
        endShadowLayer.shadowPath = path.cgPath
    }
    
    private func updateMask() {
        let endAngle = startAngle + 2 * .pi
        let maskStart = startAngle + progressLayer.strokeEnd * 2 * .pi

        let maskPath = UIBezierPath(
            arcCenter: circleCenter,
            radius: circleRadius,
            startAngle: maskStart,
            endAngle: endAngle,
            clockwise: true
        )

        trackMaskLayer.frame = bounds
        trackMaskLayer.path = maskPath.cgPath
        trackMaskLayer.lineWidth = lineWidth
        trackMaskLayer.strokeColor = UIColor.white.cgColor
    }
    
    private func updateFonts(for size: CGSize) {
        let base = min(size.width, size.height)

        titleLabel.font = UIFont.systemFont(ofSize: base * 0.3, weight: .heavy)
        subtitleLabel.font = .systemFont(ofSize: base * 0.1)
    }
    
    private func updateProgress() {
        let clamped = max(0, min(progress, 1))
        progressLayer.strokeEnd = clamped
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
