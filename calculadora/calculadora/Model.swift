//
//  Model.swift
//  calculadora
//
//  Created by Ruben on 20/3/24.
//

import Foundation
import SwiftUI

struct KeyboardButton {
    let title: String
    let textColor: Color
    let backgroundColor: Color
    let isDoubleWidth: Bool
    let type: ButtonType
}

enum ButtonType {
    case number(Int)
    case operation(OperationType)
    case result
    case reset
}

enum OperationType {
    case sum
    case subtraction
    case multiplication
    case division
}
