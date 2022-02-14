//
//  OperandViewController.swift
//  RS_Calculator
//
//  Created by Asher Ahsan on 13.02.22.
//

import UIKit

class OperandViewController: UIViewController {
    @IBOutlet weak var operationLbl: UILabel!
    @IBOutlet weak var operand1Lbl: UILabel!
    @IBOutlet weak var operand2Lbl: UILabel!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var operandLbl2StackView: UIStackView!
    
    var calculator: Calculator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        if let calculator = calculator {
            if let operation = calculator.operation {
                operationLbl.text = operation.rawValue
                if operation == .sqroot {
                    operandLbl2StackView.isHidden = true
                }
            }
            if let operand1 = calculator.operand1 {
                operand1Lbl.text = operand1.description
            }
            if let operand2 = calculator.operand2 {
                operand2Lbl.text = operand2.description
            }
        }
    }
    
    @IBAction func updateOperand(_ sender: UIButton) {
        if let calculator = calculator {
            if calculator.operand1 == nil {
                if let operand = sender.titleLabel?.text, let operand1LblText = operand1Lbl.text {
                    operand1Lbl.text = updateOperandLbl(operand: operand, text: operand1LblText)
                }
                self.doneBtn.isEnabled = true
            } else if calculator.operand2 == nil {
                if let operand = sender.titleLabel?.text, let operand2LblText = operand2Lbl.text {
                    operand2Lbl.text = updateOperandLbl(operand: operand, text: operand2LblText)
                }
            }
            self.doneBtn.isEnabled = true
        }
    }
    
    @IBAction func setOperand(_ sender: UIButton) {
        if self.calculator != nil {
            if calculator!.operand1 == nil {
                calculator!.setOperand(operand: operand1Lbl.text ?? "0", isSecondOperand: false)
                if calculator?.operation != .sqroot {
                    let vc = storyboard!.instantiateViewController(withIdentifier: "InputNumVC") as! OperandViewController
                    vc.calculator = self.calculator
                    self.navigationController?.pushViewController(vc, animated: true)
                } else {
                    self.performSegue(withIdentifier: "ShowResultSegue", sender: nil)
                }
            } else {
                calculator!.setOperand(operand: operand2Lbl.text ?? "0", isSecondOperand: true)
                self.performSegue(withIdentifier: "ShowResultSegue", sender: nil)
            }
        }
    }
    
    @IBAction func restartCalculator(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func updateOperandLbl(operand: String, text: String) -> String? {
        var tempNumHolder: String?
        
        if(operand == "C") {
            tempNumHolder = "0"
            return tempNumHolder
        }
        else if (operand == "." && text.contains(".")) || text.count == 9 {
            return text
        } else {
            if (operand == "." && text.hasPrefix("0")) {
                tempNumHolder = text + operand
            } else if text.hasPrefix("0") && !text.contains(".") {
                tempNumHolder = operand
            } else {
                tempNumHolder = text + operand
            }
            return tempNumHolder
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowResultSegue" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.calculator = self.calculator
        }
    }
}
