//
//  Rounded.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 14.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func makeRounded() {
        self.layer.masksToBounds = false
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 43
        self.clipsToBounds = true
    }
}
