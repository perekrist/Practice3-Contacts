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
    private let ringtonePicker = UIPickerView()
    
    private let ringtoneLabel = UILabel()
    private let noteLabel = UILabel()
    
    private var imagePicker: ImagePicker!
    private var avatarPicker = UIButton()
    private var phoneTextField = UITextField()
    
    private var nameTextField = UITextField()
    private var surNameTextField = UITextField()
    private var noteTextField = UITextField()
    private var ringtoneTextField = UITextField(frame: CGRect.zero)
    
    private var keyboardAvoidingView: UIScrollView = TPKeyboardAvoidingScrollView()
    
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
        setupView()
        navBarButtons()
        setupImagePicker()
        setupConstraints()
        setupTextFields()
        setupPicker()
        setupLabels()
        bindToViewModel()
    }
    
    private func bindToViewModel() {
        viewModel.onDidError = { [weak self] error in
            guard let self = self else { return }
            self.showError(error)
        }
    }
    
    private func setupView() {
        view = keyboardAvoidingView
        view.backgroundColor = #colorLiteral(red: 0.999904573, green: 1, blue: 0.9998722672, alpha: 1)
    }
    
    private func setupTextFields() {
        addInputAccessoryForTextFields(textFields: [nameTextField, surNameTextField,
                                                    phoneTextField, ringtoneTextField, noteTextField],
                                       dismissable: true, previousNextable: true)
        setupNameTextField()
        setupSurnameTextField()
        setupPhoneTextField()
        setupRingtoneTextField()
        setupNoteTextField()
    }
    
    private func setupNameTextField() {
        nameTextField.text = viewModel.contact?.name
        nameTextField.placeholder = R.string.createContact.namePlaceholder()
        nameTextField.font = UIFont.systemFont(ofSize: 16)
        nameTextField.addTarget(self, action: #selector(editName),
                                for: UIControl.Event.editingChanged)
    }
    
    private func setupSurnameTextField() {
        surNameTextField.text = viewModel.contact?.surName
        surNameTextField.placeholder = R.string.createContact.surnamePlaceholder()
        surNameTextField.font = UIFont.systemFont(ofSize: 16)
    }
    
    private func setupPhoneTextField() {
        phoneTextField.text = viewModel.contact?.phone
        phoneTextField.keyboardType = .numberPad
        phoneTextField.placeholder = R.string.createContact.phonePlaceholder()
    }
    
    private func setupRingtoneTextField() {
        ringtoneTextField.text = viewModel.contact?.ringtone
    }
    
    private func setupNoteTextField() {
        noteTextField.text = viewModel.contact?.note
        noteTextField.placeholder = R.string.createContact.notePlaceholder()
        noteTextField.font = UIFont.systemFont(ofSize: 16)
    }
    
    private func setupLabels() {
        ringtoneLabel.text = R.string.createContact.ringroneLabel()
        ringtoneLabel.font = ringtoneLabel.font.withSize(15)
        
        noteLabel.text = R.string.createContact.noteLabel()
        noteLabel.font = noteLabel.font.withSize(15)
    }
    
    @objc private func editName() {
        print(nameTextField.text!)
    }
    
    private func setupConstraints() {
        view.addSubview(avatarPicker)
        avatarPicker.snp.makeConstraints { make in
            make.top.equalTo(124)
            make.leading.equalTo(16)
            make.height.width.equalTo(86)
        }
        
        view.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(avatarPicker.snp.top).offset(10)
            make.leading.equalTo(avatarPicker.snp.trailing).offset(24)
        }
        
        view.addSubview(surNameTextField)
        surNameTextField.snp.makeConstraints { make in
            make.bottom.equalTo(avatarPicker.snp.bottom).offset(-16)
            make.leading.equalTo(nameTextField.snp.leading)
        }
        
        view.addSubview(phoneTextField)
        phoneTextField.snp.makeConstraints { make in
            make.top.equalTo(avatarPicker.snp.bottom).offset(24)
            make.leading.equalTo(avatarPicker.snp.leading)
        }
        
        let stact1 = UIStackView(arrangedSubviews: [ringtoneLabel, ringtoneTextField, Divider()])
        stact1.axis = .vertical
        stact1.spacing = 5
        view.addSubview(stact1)
        stact1.snp.makeConstraints { make in
            make.top.equalTo(phoneTextField.snp.bottom).offset(24)
            make.leading.equalTo(avatarPicker.snp.leading)
        }
        
        let stact2 = UIStackView(arrangedSubviews: [noteLabel, noteTextField, Divider()])
        stact2.axis = .vertical
        stact2.spacing = 5
        view.addSubview(stact2)
        stact2.snp.makeConstraints { make in
            make.top.equalTo(ringtoneTextField.snp.bottom).offset(24)
            make.leading.equalTo(avatarPicker.snp.leading)
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
        avatarPicker.imageView?.image = viewModel.contact?.image
        avatarPicker.setImage(R.image.plus(), for: .normal)
        avatarPicker.setBackgroundImage(R.image.circule(), for: .normal)
        avatarPicker.makeRounded()
        avatarPicker.addTarget(self, action: #selector(imagePickerTapped), for: .touchUpInside)
    }
    
    private func setImage(image: UIImage) {
        avatarPicker.setImage(image, for: .normal)
    }
}

extension CreateContactViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        self.setImage(image: image!)
    }
}

extension CreateContactViewController {
    @objc func cancelTapped() {
        viewModel.goBack()
    }
    
    @objc func doneTapped() {
        viewModel.saveContact(name: nameTextField.text!,
                              surName: surNameTextField.text!,
                              phone: phoneTextField.text,
                              image: avatarPicker.imageView?.image,
                              ringtone: ringtoneTextField.text,
                              note: noteTextField.text)
    }
    
    @objc private func imagePickerTapped(sender: UIButton) {
        self.imagePicker.present(from: sender)
    }
}

extension CreateContactViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.ringtones.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.ringtones[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ringtoneTextField.text = viewModel.ringtones[row]
    }
    
    private func setupPicker() {
        ringtonePicker.delegate = self
        ringtonePicker.dataSource = self
        
        ringtoneTextField.inputView = ringtonePicker
        ringtoneTextField.text = viewModel.ringtones[0]
    }
}
