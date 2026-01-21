//
//  CircleProgressView.swift
//  HealthTraker
//
//  Created by User on 21/01/26.
//

import UIKit

final class CircleProgressView: UIView {
    // MARK: - Types
    enum TrackStyle {
        case solid
        case dashed
    }

    // MARK: - Public API
    var progress: CGFloat = 0 {
        didSet { updateProgress() }
    }

    var lineWidth: CGFloat = 10 {
        didSet { updatePath() }
    }

    var progressColor: UIColor = .systemTeal {
        didSet { progressLayer.strokeColor = progressColor.cgColor }
    }

    var trackColor: UIColor = UIColor.white.withAlphaComponent(0.1) {
        didSet { trackLayer.strokeColor = trackColor.cgColor }
    }

    var trackStyle: TrackStyle = .dashed {
        didSet { applyTrackStyle() }
    }

    var dashLength: CGFloat = 2 {
        didSet { applyTrackStyle() }
    }

    var dashSpacing: CGFloat = 4 {
        didSet { applyTrackStyle() }
    }

    // MARK: - Layers
    private let trackLayer = CAShapeLayer()
    private let progressLayer = CAShapeLayer()

    private let startAngle = -CGFloat.pi / 2

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayers()
    }

    // MARK: - Setup
    private func setupLayers() {
        backgroundColor = .clear

        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = .butt
        trackLayer.strokeEnd = 1

        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round

        layer.addSublayer(trackLayer)
        layer.addSublayer(progressLayer)

        applyTrackStyle()
    }

    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        updatePath()
    }

    private func updatePath() {
        let radius = min(bounds.width, bounds.height) / 2 - lineWidth / 2
        let center = CGPoint(x: bounds.midX, y: bounds.midY)

        let path = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: startAngle + 2 * .pi,
            clockwise: true
        )

        [trackLayer, progressLayer].forEach {
            $0.frame = bounds
            $0.path = path.cgPath
            $0.lineWidth = lineWidth
        }

        updateProgress()
    }

    private func updateProgress() {
        let clamped = max(0, min(progress, 1))
        progressLayer.strokeEnd = clamped
    }

    private func applyTrackStyle() {
        switch trackStyle {
        case .solid:
            trackLayer.lineDashPattern = nil

        case .dashed:
            trackLayer.lineDashPattern = [
                NSNumber(value: Float(dashLength)),
                NSNumber(value: Float(dashSpacing))
            ]
        }
    }
}
