//
//  Font+Extension.swift
//  HealthTraker
//
//  Created by User on 04/02/26.
//

import Foundation
import SwiftUI

enum AppFont {
    enum Font {
        case thin
        case extraLight
        case light
        case regular
        case medium
        case semibold
        case bold
        case extraBold
        case black
        
        fileprivate var postScriptName: String {
            switch self {
            case .thin:        return "Montserrat-Thin"
            case .extraLight:  return "Montserrat-ExtraLight"
            case .light:       return "Montserrat-Light"
            case .regular:     return "Montserrat-Regular"
            case .medium:      return "Montserrat-Medium"
            case .semibold:    return "Montserrat-SemiBold"
            case .bold:        return "Montserrat-Bold"
            case .extraBold:   return "Montserrat-ExtraBold"
            case .black:       return "Montserrat-Black"
            }
        }
    }
}

extension UIFont {
    static func montserrat(ofSize: CGFloat, weight: AppFont.Font) -> UIFont {
        UIFont(
            name: weight.postScriptName,
            size: ofSize
        ) ?? .systemFont(ofSize: ofSize)
    }
}

extension Font {
    static func montserrat(
        size: CGFloat,
        weight: AppFont.Font
    ) -> Font {
        .custom(weight.postScriptName, size: size)
    }
}

extension AppFont.Font {
    var swiftUIWeight: Font.Weight {
        switch self {
        case .thin:       .thin
        case .extraLight: .ultraLight
        case .light:      .light
        case .regular:    .regular
        case .medium:     .medium
        case .semibold:   .semibold
        case .bold:       .bold
        case .extraBold:  .heavy
        case .black:      .black
        }
    }
}
