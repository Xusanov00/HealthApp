//
//  LineChartTableViewCell.swift
//  HealthTraker
//
//  Created by Ali on 21/12/2025.
//

import UIKit
import SwiftUI

class LineChartTableViewCell: UITableViewCell {
	@Published private var recoveryData: [HealthInfoDM] = []
	private let backView = UIView().configured { view in
		view.backgroundColor = ColorLibrary.gray1
		view.layer.cornerRadius = 22
	}
	private let titleIcon = UIImageView().configured { image in
		image.contentMode = .scaleAspectFill
	}
	private let titleLabel = UILabel().configured { label in
		label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
		label.numberOfLines = 1
		label.textAlignment = .left
	}

//	private lazy var hostingBarChart = UIHostingController(
//		rootView: LineChartComponent(parameters: .init(backgroundColor: .clear, content: recoveryData, labelMode: .day)) {
//			$0.formatted(.dateTime.weekday(.abbreviated))
//		}
//	)

	private lazy var hostingBarChart = UIHostingController(
		rootView: BarChartComponent(content: recoveryData) {
			$0.formatted(.dateTime.weekday(.abbreviated))
		}
	)
	
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
	
	private func setupUI() {
		backView.translatesAutoresizingMaskIntoConstraints = false
		let titleStack = UIStackView(arrangedSubviews: [titleIcon, titleLabel]).configured { stack in
			stack.axis = .horizontal
			stack.alignment = .fill
			stack.distribution = .fill
			stack.spacing = 16
		}
		titleStack.translatesAutoresizingMaskIntoConstraints = false
		
		// Init
		contentView.addSubview(backView)
		backView.addSubview(titleStack)
		
	}
	
	func configureCell(data: HealthInfoDM) {
		
	}
}

