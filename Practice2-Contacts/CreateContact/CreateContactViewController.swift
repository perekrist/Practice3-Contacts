//
//  CreateContactViewController.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 07.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class CreateContactViewController: UIViewController {
    private let viewModel: CreateContactViewModel
    private var createContactView = CreateContactView()
    
    init(viewModel: CreateContactViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

extension CreateContactViewController {
    private func initialSetup() {
        view.backgroundColor = #colorLiteral(red: 0.999904573, green: 1, blue: 0.9998722672, alpha: 1)
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(createContactView)
        createContactView.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.leading.equalToSuperview()
        }
    }
}
