//
//  ViewController.swift
//  Calculator
//
//  Created by Konstantin Dmitrievskiy on 28.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isInputFinised = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot conver")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calculationButtonPressed(_ sender: UIButton) {
        isInputFinised = true
        
        calculator.setNumber(displayValue)
        
        if let method = sender.currentTitle {
            if let result = calculator.calculate(symbol: method) {
                displayValue = result
            }
        }
    }
    
    @IBAction func digitButtonPressed(_ sender: UIButton) {
        if let title = sender.currentTitle {
            if  isInputFinised {
                displayLabel.text = title
                isInputFinised = false
            } else {
                if title == "." {
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + title
            }
        }
    }
}

