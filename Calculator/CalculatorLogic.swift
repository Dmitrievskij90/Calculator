//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Konstantin Dmitrievskiy on 28.03.2021.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    //Stores first number and operation
    private var bufferCalculation: (firstNumber: Double, operation: String)?
    
    mutating func calculate(symbol: String) -> Double? {
        if let value = number {
            switch symbol {
            case "AC":
                return 0
            case "%":
                return value * 0.01
            case "+/-":
                return value * -1
            case "=":
                return finalCalculation(secondNumber: value)
            default:
                bufferCalculation = (firstNumber: value, operation: symbol)
            }
        }
        return nil
    }
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    private func finalCalculation(secondNumber: Double) -> Double? {
        if let n = bufferCalculation?.firstNumber, let operation = bufferCalculation?.operation {
            switch operation {
            case "+":
                return n + secondNumber
            case "−":
                return n - secondNumber
            case "×":
                return n * secondNumber
            case "÷":
                return n / secondNumber
            default:
                fatalError()
            }
        }
        return nil
    }
}

