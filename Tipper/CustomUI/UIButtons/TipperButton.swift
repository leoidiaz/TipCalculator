//
//  TipperButton.swift
//  Tipper
//
//  Created by Leonardo Diaz on 5/18/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

import UIKit

class TipperButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        updateFontTo()
        setupUI()
    }
    
    func updateFontTo(){
        guard let size = self.titleLabel?.font.pointSize else { return }
        self.titleLabel?.font = UIFont(name: FontNames.avenirNextMedium, size: size)!
    }
    
    func setupUI(){
        self.backgroundColor = .mainTextColor
        self.setTitleColor(.background, for: .normal)
        self.addCornerRadius(10)
    }
}

class TipPercentButton: TipperButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
    }
    
    func updateUI(){
        self.setTitleColor(.whiteCloud, for: .normal)
        self.backgroundColor = .background
    }
}
