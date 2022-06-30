//
//  DecimalUtils.swift
//  Bankey
//
//  Created by Diego Ferreira on 28/06/22.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
