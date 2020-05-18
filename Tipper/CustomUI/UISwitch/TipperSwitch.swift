//
//  TipperSwitch.swift
//  Tipper
//
//  Created by Leonardo Diaz on 5/18/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

import UIKit

class TipperSwitch: UISwitch {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI(){
        self.thumbTintColor = .whiteCloud
        self.onTintColor = .mainTextColor
    }
}
