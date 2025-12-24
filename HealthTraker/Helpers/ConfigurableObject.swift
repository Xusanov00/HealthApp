//
//  ConfigurableObject.swift
//  HealthTraker
//
//  Created by Ali on 11/12/2025.
//

import UIKit

public protocol ConfigurableObject { }

extension ConfigurableObject {
    public func configured(_ closure: (Self) -> Void) -> Self {
        closure(self)
        return self
    }
}

extension NSObject: ConfigurableObject { }
