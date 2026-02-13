////
////  LiquidGlassImageWithTitleView.swift
////  HealthTraker
////
////  Created by User on 09/02/26.
////
//
//
//import UIKit
//import Utility
//import Foundation
//import Localization
//
//public final class LiquidGlassImageWithTitleView: UIView{
//    
//    public enum NavigationType{
//        
//        case pedometer
//        case bmi
//        
//        var text: String{
//            switch(self){
//            case .pedometer: return LOCALIZE("pedometer_text")
//            case .bmi: return LOCALIZE("bmi_short_text")
//            }
//        }
//        
//        var image: UIImage?{
//            switch(self){
//            case .pedometer: return UIImage.utilityNamed("pedometerWidgetIcon")
//            case .bmi: return UIImage.utilityNamed("bmiBodyIcon")
//            }
//        }
//        
//    }
//    
//    private let type: NavigationType
//    
//    private let label: UILabel = {
//        let label: UILabel = .init()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = AppFont.with(type: .bold, size: 16.0)
//        label.textColor = .white
//        return label
//    }()
//    
//    private let imageView: UIImageView = {
//        let view: UIImageView = .init()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.contentMode = .scaleAspectFit
//        return view
//    }()
//    
//    public init(type: NavigationType){
//        self.type = type
//        super.init(frame: .zero)
//        prepare()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func prepare(){
//        addSubview(label)
//        addSubview(imageView)
//        
//        NSLayoutConstraint.activate([
//            
//            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
//            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
//            imageView.heightAnchor.constraint(equalToConstant: 24.0),
//            imageView.widthAnchor.constraint(equalToConstant: 24.0),
//            
//            label.centerYAnchor.constraint(equalTo: centerYAnchor),
//            label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10.0),
//            label.heightAnchor.constraint(equalToConstant: 26.0),
//            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: type == .bmi ? 0.0 : -8.0),
//        ])
//        
//        label.text = type.text
//        imageView.image = type.image
//    }
//    
//}
