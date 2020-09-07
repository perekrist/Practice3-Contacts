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
    private var avatarPicker = UIButton()
    private var phoneTextField = UITextField()
    private let ringtonePicker = UIPickerView()
    
    private var ringtones: [String] = ["Default", "Duck", "Bark", "Piano", "Guitar"]
    
    private var nameTextField = UITextField()
    private var surNameTextField = UITextField()
    private var noteTextField = UITextField()
    private var ringtone = UITextField(frame: CGRect.zero)
    
    
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
        setupImagePicker()
        setupConstraints()
        setupTextFields()
        setupPicker()
    }
    
    private func setupTextFields() {
        view.addSubview(phoneTextField)
        phoneTextField.keyboardType = .numberPad
        addInputAccessoryForTextFields(textFields: [phoneTextField], dismissable: true, previousNextable: true)
        
        view.addSubview(noteTextField)
        noteTextField.snp.makeConstraints { make in
            make.top.equalTo(phoneTextField.snp.bottom).offset(16)
            make.leading.equalTo(16)
        }
        
        phoneTextField.placeholder = "89131131314"
        noteTextField.placeholder = "this is a note"
        nameTextField.placeholder = "name"
        surNameTextField.placeholder = "surname"
        
        nameTextField.font = UIFont.systemFont(ofSize: 16)
        surNameTextField.font = UIFont.systemFont(ofSize: 16)
        noteTextField.font = UIFont.systemFont(ofSize: 16)
        
        nameTextField.addBottomBorder()
        surNameTextField.addBottomBorder()
        noteTextField.addBottomBorder()
        
        nameTextField.addTarget(self, action: #selector(editName),
                                for: UIControl.Event.editingChanged)
    }
    
    private func setupPicker() {
        ringtone.inputView = ringtonePicker
        ringtone.becomeFirstResponder()
    }
    
    @objc private func editName() {
        print(nameTextField.text)
    }
    
    private func setupConstraints() {
        view.addSubview(avatarPicker)
        avatarPicker.snp.makeConstraints { make in
            make.top.equalTo(124)
            make.leading.equalTo(16)
            make.height.equalTo(86)
            make.width.equalTo(86)
        }
        
        let mainInfoVStack = UIStackView(arrangedSubviews: [nameTextField, surNameTextField])
        mainInfoVStack.axis = .vertical
        
        view.addSubview(mainInfoVStack)
        mainInfoVStack.snp.makeConstraints { make in
            make.leading.equalTo(24)
            make.top.equalTo(avatarPicker.snp.bottom).offset(16)
        }
        
        view.addSubview(ringtone)
        ringtone.snp.makeConstraints { make in
            make.top.equalTo(mainInfoVStack.snp.bottom).offset(24)
            make.leading.equalTo(16)
        }
        
        let additionalInfoVStack = UIStackView(arrangedSubviews: [phoneTextField, noteTextField])
        additionalInfoVStack.axis = .vertical
        
        view.addSubview(additionalInfoVStack)
        additionalInfoVStack.snp.makeConstraints { make in
            make.top.equalTo(ringtone.snp.bottom).offset(24)
            make.leading.equalTo(16)
        }
    }
    
    private func navBarButtons() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                           target: self,
                                                           action: #selector(cancelTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,
                                                            target: self,
                                                            action: #selector(doneTapped))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.systemBlue
        navigationItem.rightBarButtonItem?.tintColor = UIColor.systemBlue
    }
    
    private func setupImagePicker() {
        avatarPicker.layer.cornerRadius = avatarPicker.bounds.size.width / 2
        avatarPicker.clipsToBounds = true
        avatarPicker.setImage(R.image.plus(), for: .normal)
        avatarPicker.setBackgroundImage(R.image.circule(), for: .normal)
        avatarPicker.addTarget(self, action: #selector(imagePickerTapped), for: .touchUpInside)
    }
    
    private func setImage(image: UIImage) {
        avatarPicker.setImage(image, for: .normal)
        avatarPicker.layer.cornerRadius = avatarPicker.bounds.size.width / 2
        avatarPicker.clipsToBounds = true
    }
}

extension CreateContactViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        self.setImage(image: image!)
    }
}

extension CreateContactViewController {
    @objc func cancelTapped() {
        print("cancel")
    }
    
    @objc func doneTapped() {
        print("done")
    }
    
    @objc private func imagePickerTapped(sender: UIButton) {
        self.imagePicker.present(from: sender)
    }
}
