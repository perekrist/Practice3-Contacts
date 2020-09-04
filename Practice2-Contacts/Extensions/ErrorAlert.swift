//
//  ErrorAlert.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 04.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit

extension UIViewController {
    func showError(_ error: Error) {
        let alert = UIAlertController(title: R.string.common.errorTitle(), message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: R.string.common.okTitle(), style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
