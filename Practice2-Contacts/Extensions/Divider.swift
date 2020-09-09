//
//  Divider.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 09.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class Divider: UIView {
    override func didMoveToSuperview() {
        self.backgroundColor = #colorLiteral(red: 0.7853929996, green: 0.7800505757, blue: 0.8017302155, alpha: 1)
        self.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.width.equalTo(UIScreen.main.bounds.width)
        }
    }
}
