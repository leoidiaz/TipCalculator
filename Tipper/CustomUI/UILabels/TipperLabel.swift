//
//  TipperLabel.swift
//  Tipper
//
//  Created by Leonardo Diaz on 5/18/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

import UIKit

class TipperLabel: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.updateFontTo(name: FontNames.avenirNext)
        self.textColor = .mainTextColor
    }
    
    func updateFontTo(name: String){
        let size = self.font.pointSize
        self.font = UIFont(name: name, size: size)!
    }

}

class TipperLabelBold: TipperLabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.updateFontTo(name: FontNames.avenirNextMedium)
    }
}
