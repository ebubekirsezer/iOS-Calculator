//
//  ViewController.swift
//  iOS-Calculator
//
//  Created by Ebubekir on 24.07.2019.
//  Copyright © 2019 Ebubekir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var firstNumber : Double = 0
    var nextNumber : Double = 0
    var isMath : Bool = false
    var operation : Int = 0
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func numberButtons(_ sender: UIButton) {
        if isMath == true {
            resultLabel.text = String(sender.tag - 1)
            nextNumber = Double(resultLabel.text!)!
            isMath = false
        }
        else{
            resultLabel.text = resultLabel.text! + String(sender.tag - 1)
            nextNumber = Double(resultLabel.text!)!
        }
    }
    
    
    @IBAction func operationButtons(_ sender: UIButton) {
        if resultLabel.text != "" && sender.tag != 11 && sender.tag != 17{
            firstNumber = Double(resultLabel.text!)!
            if sender.tag == 12 {
                //%
                resultLabel.text = "%"

            }
            else if sender.tag == 13 {
                // /
                resultLabel.text = "/"

            }
            else if sender.tag == 14 {
                // *
                resultLabel.text = "X"
            }
            else if sender.tag == 15 {
                // -
                resultLabel.text = "-"
            }
            else if sender.tag == 16 {
                // +
                resultLabel.text = "+"
            }
            operation = sender.tag
            isMath = true
        }
        else if sender.tag == 11{
            firstNumber = 0
            nextNumber = 0
            operation = 0
            resultLabel.text = ""
        }
        else if sender.tag == 17{
            if operation == 12 {
                resultLabel.text = String(firstNumber / 100)
            }
            else if operation == 13 {
                resultLabel.text = String(firstNumber / nextNumber)
            }
            else if operation == 14 {
                resultLabel.text = String(firstNumber * nextNumber)
            }
            else if operation == 15 {
                resultLabel.text = String(firstNumber - nextNumber)
            }
            else if operation == 16 {
                resultLabel.text = String(firstNumber + nextNumber)
            }
        }
    }
    
   
}

