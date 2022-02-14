//
//  ResultViewController.swift
//  RS_Calculator
//
//  Created by Shornali on 14.02.22.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultLbl: UILabel!
    
    var calculator: Calculator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let calculator = calculator {
            if let result = calculator.result {
                resultLbl.text = result.description
            }
        }
    }
    
    @IBAction func restartCalculator(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
