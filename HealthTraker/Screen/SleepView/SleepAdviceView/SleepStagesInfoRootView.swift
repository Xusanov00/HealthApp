//
//  SleepStagesInfoRootView.swift
//  HealthTraker
//
//  Created by User on 12/02/26.
//

import UIKit

class SleepStagesInfoRootView: CleanView {
    // MARK: - Subviews
    private let sleepIconTitle = IconLabel().configured { view in
        view.text = "Стадии сна"
        view.icon = "sleep_ic"
    }
    private let xmarkButton = UIButton().configured { button in
        button.setImage(UIImage(named: "xmark_ic"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let scrollView = UIScrollView()
    private let stack = UIStackView()
    
    let stages: [SleepStageInfo] = [
        .init(color: .systemPink, title: "Бодрствование", body: "Мы засыпаем не сразу и периодически просыпаемся ночью. Это время отмечено как «Бодрствование» на графиках."),
        .init(color: .systemOrange, title: "Быстрый", body: "Согласно исследованиям, фаза быстрого сна может быть особенно важна для процессов, связанных с памятью и восстановлением мозга. Именно во время этой фазы Вы видите больше всего снов. При этом Вы совершаете движения глазными яблоками. Первая фаза быстрого сна начинается спустя примерно 90 минут после засыпания."),
        .init(color: .systemTeal, title: "Базовый", body: "Большая часть периода сна приходится на эту стадию: во время нее мышечная активность снижается, а температура тела падает. Эту стадию иногда называют поверхностным или неглубоким сном, однако она так же важна, как и другие."),
        .init(color: .systemBlue, title: "Глубокий", body: "Эта фаза сна также называется медленно-волновым сном. В этот период организм восстанавливается и вырабатывает жизненно важные гормоны. Такая фаза длится дольше в первую половину ночи. От глубокого сна зачастую бывает сложно проснуться, так как организм полностью расслаблен.")
    ]

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        stack.axis = .vertical
        stack.spacing = 16

        addSubview(scrollView)
        scrollView.addSubview(stack)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            stack.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 16),
            stack.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor, constant: -16),
            stack.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -16)
        ])

        setupTitle()
        stages.forEach { stack.addArrangedSubview(SleepStageInfoView(model: $0)) }
    }
    
    
    private func setupTitle() {
        addSubview(sleepIconTitle)
        addSubview(xmarkButton)
        
        NSLayoutConstraint.activate([
            sleepIconTitle.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            sleepIconTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            sleepIconTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 42),
            
            xmarkButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            xmarkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
            xmarkButton.heightAnchor.constraint(equalToConstant: 24),
            xmarkButton.widthAnchor.constraint(equalToConstant: 24),
        ])
    }

}

struct SleepStageInfo {
    let color: UIColor
    let title: String
    let body: String
}

final class SleepStageInfoView: UIView {
    private let dot = UIView()
    private let titleLabel = UILabel()
    private let bodyLabel = UILabel()
    private let vStack = UIStackView()

    init(model: SleepStageInfo) {
        super.init(frame: .zero)
        dot.translatesAutoresizingMaskIntoConstraints = false
        dot.layer.cornerRadius = 4
        dot.backgroundColor = model.color

        titleLabel.font = .montserrat(ofSize: 18, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.text = model.title

        bodyLabel.font = .montserrat(ofSize: 14, weight: .regular)
        bodyLabel.textColor = .white.withAlphaComponent(0.7)
        bodyLabel.numberOfLines = 0
        bodyLabel.text = model.body

        let top = UIStackView(arrangedSubviews: [dot, titleLabel])
        top.axis = .horizontal
        top.spacing = 8
        top.alignment = .center

        vStack.axis = .vertical
        vStack.spacing = 8
        vStack.addArrangedSubview(top)
        vStack.addArrangedSubview(bodyLabel)

        addSubview(vStack)
        vStack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            dot.widthAnchor.constraint(equalToConstant: 8),
            dot.heightAnchor.constraint(equalToConstant: 8),
            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) { fatalError() }
}
