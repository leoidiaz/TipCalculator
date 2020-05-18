//
//  TipperStepper.swift
//  Tipper
//
//  Created by Leonardo Diaz on 5/18/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

import UIKit

class TipperStepper: UIStepper {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
        self.addCornerRadius(5)
    }
    
    func updateUI(){
        self.backgroundColor = .mainTextColor
    }

}
