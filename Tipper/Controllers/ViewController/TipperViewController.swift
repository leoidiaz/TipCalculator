//
//  TipperViewController.swift
//  Tipper
//
//  Created by Leonardo Diaz on 5/18/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

import UIKit

class TipperViewController: UIViewController {
    
    @IBOutlet weak var subTotalTextField: UITextField!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var fifteenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var splitSwitch: UISwitch!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitAmountLabel: UILabel!
    @IBOutlet weak var splitStepper: UIStepper!
    
    var tip = 0.0
    var splitBetween = 1
    var total = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        resetButtons()
        sender.backgroundColor = .mainTextColor
        sender.setTitleColor(.background, for: .normal)
        guard let tipTitle = sender.currentTitle else { return }
        let prepareDouble = String(tipTitle.dropLast())
        guard let tipDouble = Double(prepareDouble) else { return }
        tip = tipDouble / 100
    }
    
    @IBAction func splitSwitchedToggled(_ sender: UISwitch) {
        if sender.isOn {
            UIView.animate(withDuration: 0.2) {
                self.splitAmountLabel.isHidden = false
                self.splitStepper.isHidden = false
                self.splitBetween = 2
                self.splitStepper.value = 2
                self.splitAmountLabel.text = "2"
            }
        } else {
            UIView.animate(withDuration: 0.2) {
                self.splitAmountLabel.isHidden = true
                self.splitStepper.isHidden = true
                self.splitBetween = 1
            }
        }
    }
    
    @IBAction func splitSteppedTapped(_ sender: UIStepper) {
        splitStepper.minimumValue = 2
        splitAmountLabel.text = String(format: "%.0f", sender.value)
        splitBetween = Int(sender.value)
    }
    
    @IBAction func calculateButtonTapped(_ sender: Any) {
        guard let subtotal = subTotalTextField.text, !subtotal.isEmpty else { totalLabel.text = "Enter a subtotal" ;return }
        guard let updatedTotal = Double(subtotal) else { totalLabel.text = "NaN" ; return}
        let sum = (updatedTotal * tip + updatedTotal) / Double(splitBetween)
        totalLabel.text = "$ \(sum)"
    }
    
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.2){
            self.resetButtons()
            self.subTotalTextField.resignFirstResponder()
            self.tip = 0.0
            self.splitBetween = 1
            self.total = 0.0
            self.totalLabel.text = "Total"
            self.subTotalTextField.text = ""
            self.splitSwitch.isOn = false
            self.splitAmountLabel.isHidden = true
            self.splitStepper.isHidden = true
        }
    }
    
    func resetButtons(){
        tenButton.isSelected = false
        tenButton.setTitleColor(.whiteCloud, for: .normal)
        tenButton.backgroundColor = .background
        fifteenButton.isSelected = false
        fifteenButton.backgroundColor = .background
        fifteenButton.setTitleColor(.whiteCloud, for: .normal)
        twentyButton.isSelected = false
        twentyButton.backgroundColor = .background
        twentyButton.setTitleColor(.whiteCloud, for: .normal)
    }
    
    func setUI(){
        self.view.backgroundColor = .background
        self.splitAmountLabel.isHidden = true
        self.splitStepper.isHidden = true
    }
}
