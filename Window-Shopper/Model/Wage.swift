//
//  Wage.swift
//  Window-Shopper
//
//  Created by Shay Dubrovsky on 13/08/2018.
//  Copyright © 2018 Shay Dubrovsky. All rights reserved.
//

import Foundation
class Wage {
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        return Int(ceil(price / wage))
    }
}
