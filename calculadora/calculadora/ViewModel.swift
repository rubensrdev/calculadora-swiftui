//
//  ViewModel.swift
//  calculadora
//
//  Created by Ruben on 21/3/24.
//

import Foundation

final class ViewModel: ObservableObject {
    
    @Published var textFieldValue: String = "0"
    
    var textFieldSavedValue: String = "0"
    var currentOperationToExecute: OperationType?
    var shoudRunOperation: Bool = false
    
    func logic(key: KeyboardButton) {
        switch key.type {
            case .number(let value):
                if shoudRunOperation {
                    textFieldValue = "0"
                }
                textFieldValue = textFieldValue == "0" ? "\(value)" : textFieldValue + "\(value)"
            case .reset:
                textFieldValue = "0"
                textFieldSavedValue = "0"
                currentOperationToExecute = nil
                shoudRunOperation = false
            case .result:
                guard let operation = currentOperationToExecute else {
                    return
                }
                switch operation {
                    case .sum:
                        textFieldValue = "\(Int(textFieldValue)! + Int(textFieldSavedValue)!)"
                    case .subtraction:
                        textFieldValue = "\(Int(textFieldValue)! - Int(textFieldSavedValue)!)"
                    case .multiplication:
                        textFieldValue = "\(Int(textFieldValue)! * Int(textFieldSavedValue)!)"
                    case .division:
                        textFieldValue = "\(Int(textFieldValue)! / Int(textFieldSavedValue)!)"
                }
            case .operation(let type):
                textFieldSavedValue = textFieldValue
                currentOperationToExecute = type
                shoudRunOperation = true
            }
    }
    
}
