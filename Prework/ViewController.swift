//
//  ViewController.swift
//  Prework
//
//  Created by Yifei on 7/16/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var partySize: UILabel!
    @IBOutlet weak var splitTip: UILabel!
    @IBOutlet weak var sizeStepper: UIStepper!
    var oldValue = 0
    var totalVal = Double(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
        oldValue = Int(sizeStepper.value)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nav = self.navigationController?.navigationBar
        if UserDefault.getIsDark() {
            overrideUserInterfaceStyle = .dark
            nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
        else {
            overrideUserInterfaceStyle = .light
            nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        }
        let pcts = UserDefault.getTipPcts()
        for (idx, opt) in pcts.enumerated() {
            let displayOption = Int(opt * 100)
            tipControl.setTitle("\(displayOption)%", forSegmentAt: idx)
        }
        
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = UserDefault.getTipPcts()
        let tip = bill *
            tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalVal = total
        totalLabel.text = String(format: "$%.2f", total)
        
        billAmountTextField.becomeFirstResponder()
    }

    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get total tip by multiplying tip * tipPercentage
        let tipPercentages = UserDefault.getTipPcts()
        let tip = bill *
            tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalVal = total
        totalLabel.text = String(format: "$%.2f", total)
        let num = Int(partySize.text!)
        let splitVal = totalVal / Double(num!)
        splitTip.text = String(format: "$%.2f", splitVal) + " per person"
    }
    
    @IBAction func onValueChange(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tipPercentages = UserDefault.getTipPcts()
        let tip = bill *
            tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        totalVal = total
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        let num = Int(partySize.text!)
        let splitVal = totalVal / Double(num!)
        splitTip.text = String(format: "$%.2f", splitVal) + " per person"
    }
    
    @IBAction func partySizeChange(_ sender: Any) {
        var num = Int(partySize.text!)
        
        if Int(sizeStepper.value) > oldValue {
            num! += 1
            partySize.text = String(num!)
            oldValue = Int(sizeStepper.value)
        }
        else {
            num! -= 1
            partySize.text = String(num!)
            oldValue =  Int(sizeStepper.value)
        }
        let splitVal = totalVal / Double(num!)
        splitTip.text = String(format: "$%.2f", splitVal) + " per person"
    }
}

