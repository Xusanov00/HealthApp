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
        let hostageviewcontroller = UIHostingController(rootView: InstructionView())
        addSubview(hostageviewcontroller.view)
        setupTableView()
    }
    
    private func setupTableView() {
        let tableView = UITableView()
        tableView.backgroundColor = .gray
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

struct InstructionView: View {
    @State private var showCameraSettingsAlert = false

    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
        }
        .alert(isPresented: $showCameraSettingsAlert) {
            cameraGoSettingsAlert
        }
        .onAppear {
            showCameraSettingsAlert = true
        }
    }
    
    private var cameraGoSettingsAlert: Alert {
        Alert(
            title: Text("Settings.title"),
            message: Text("Settings.subtitle"),
            primaryButton: .default(
                Text("settings"),
                action: {
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url)
                    }
                }
            ),
            secondaryButton: .cancel(),
        )
    }
}
