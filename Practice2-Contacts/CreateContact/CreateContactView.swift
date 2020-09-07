//
//  CreateContactView.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 07.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

class CreateContactView: UIView {
    private var nameTextField = UITextField()
    private var surNameTextField = UITextField()
    private var phoneTextField = UITextField()
    private var noteTextField = UITextField()
    private var avatarButton = UIButton()
    
    override func didMoveToSuperview() {
        initial()
    }
}

extension CreateContactView {
    private func initial() {
        self.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        setupTextFields()
        setuoAvatarPlaceholder()
        setupConstraints()
    }
    
    private func setupTextFields() {
        nameTextField.text = "text"
        surNameTextField.text = "surname"
        noteTextField.text = "note"
        
        nameTextField.font = UIFont.systemFont(ofSize: 16)
        surNameTextField.font = UIFont.systemFont(ofSize: 16)
        noteTextField.font = UIFont.systemFont(ofSize: 16)
        
        nameTextField.addBottomBorder()
        surNameTextField.addBottomBorder()
        noteTextField.addBottomBorder()
    }
    
    private func setuoAvatarPlaceholder() {
        avatarButton.setImage(R.image.plus(), for: .normal)
        avatarButton.setBackgroundImage(R.image.circule(), for: .normal)
    }
    
    private func setupConstraints() {
        self.addSubview(avatarButton)
        avatarButton.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(24)
        }
        
        let mainInfoVStack = UIStackView(arrangedSubviews: [nameTextField, surNameTextField])
        mainInfoVStack.axis = .vertical
        
        self.addSubview(mainInfoVStack)
        mainInfoVStack.snp.makeConstraints { make in
            make.leading.equalTo(avatarButton.snp.trailing).offset(24)
            make.top.equalTo(avatarButton.snp.top)
        }
        
        let additionalInfoVStack = UIStackView(arrangedSubviews: [phoneTextField, noteTextField])
        additionalInfoVStack.axis = .vertical
        
        self.addSubview(additionalInfoVStack)
        additionalInfoVStack.snp.makeConstraints { make in
            make.top.equalTo(avatarButton.snp.bottom).offset(-24)
            make.leading.equalTo(avatarButton.snp.leading)
        }
    }
}
