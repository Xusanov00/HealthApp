//
//  RecoveryRootView.swift
//  HealthTraker
//
//  Created by Ali on 21/12/2025.
//

import UIKit
import SwiftUI

class RecoveryRootView: CleanView {
    // MARK: - Subviews
    weak var tableView: UITableView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
    }
    
    private func setupTableView() {
        let tableView = UITableView()
		tableView.backgroundColor = ColorLibrary.backgroundBlack
        tableView.showsVerticalScrollIndicator = false
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
}

struct GlassButtonView: View {
	var body: some View {
		ZStack {
			Color.blue.ignoresSafeArea()

			VStack(spacing: 20) {

				if #available(iOS 26.0, *) {
					Button("Action") { }
						.buttonStyle(.glass)
						.tint(.red)
				} else {
					Button("Action") { }
						.buttonStyle(.borderedProminent)
				}

				if #available(iOS 26.0, *) {
					Button("Prominent") { }
						.buttonStyle(.glassProminent)
						.tint(.red)
				}

				Button(action: {}) {
					Image(systemName: "chevron.forward")
						.font(.title2.bold())
						.padding(12)
						.background(.ultraThinMaterial, in: Circle())
				}
				.shadow(radius: 4)

			}
			.padding()
		}
	}
}
