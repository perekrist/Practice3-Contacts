//
//  TextFieldBottomBorder.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 07.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func addBottomBorder() {
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = #colorLiteral(red: 0.7646407485, green: 0.7647491693, blue: 0.7646064162, alpha: 1)
        border.frame = CGRect(origin: CGPoint(x: 0, y: self.frame.size.height - borderWidth),
                              size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
