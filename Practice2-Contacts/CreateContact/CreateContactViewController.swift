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
    private var imagePicker: ImagePicker!
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
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        self.createContactView.setup(imagePicker: imagePicker)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.999904573, green: 1, blue: 0.9998722672, alpha: 1)
    }
}

extension CreateContactViewController {
    private func initialSetup() {
        view.backgroundColor = #colorLiteral(red: 0.999904573, green: 1, blue: 0.9998722672, alpha: 1)
        navBarButtons()
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(createContactView)
        createContactView.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.leading.equalToSuperview()
        }
    }
    
    private func navBarButtons() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                           target: self,
                                                           action: #selector(cancelTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,
                                                            target: self,
                                                            action: #selector(imagePickerTapped))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.systemBlue
        navigationItem.rightBarButtonItem?.tintColor = UIColor.systemBlue
    }
    
    @objc func cancelTapped() {
        print("cancel")
    }
    
    @objc func doneTapped() {
        print("done")
    }
    
    @objc func imagePickerTapped(sender: UIButton) {
        print("image")
        self.imagePicker.present(from: sender)
    }
}

extension CreateContactViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        self.createContactView.setImage(image: image!)
    }
}
