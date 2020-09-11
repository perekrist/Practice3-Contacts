//
//  ContactViewController.swift
//  Practice2-Contacts
//
//  Created by Кристина Перегудова on 09.09.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import UIKit
import SnapKit

class ContactViewController: UIViewController {
    private let viewModel: ContactViewModel
    
    private lazy var avatarImageView = UIImageView()
    private lazy var nameLabel = UILabel()
    private lazy var surnameLabel = UILabel()
    private lazy var phoneLabel = UILabel()
    private lazy var ringtoneLabel = UILabel()
    private lazy var noteLabel = UILabel()
    
    private var phoneTopLabel = UILabel()
    private var ringtoneTopLabel = UILabel()
    private var noteTopLabel = UILabel()
    
    init(viewModel: ContactViewModel) {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.999904573, green: 1, blue: 0.9998722672, alpha: 1)
    }
}

extension ContactViewController {
    private func initialSetup() {
        view.backgroundColor = #colorLiteral(red: 0.999904573, green: 1, blue: 0.9998722672, alpha: 1)
        navBarButtons()
        constraintsLayout()
        setupImageView()
        setupLabels()
    }
    
    private func setupImageView() {
        avatarImageView.image = viewModel.contact.image
        avatarImageView.backgroundColor = UIColor.lightGray
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.size.width / 2
        avatarImageView.clipsToBounds = true
    }
    
    private func setupLabels() {
        setupNameLabel()
        setupSurnameLabel()
        setupPhoneLabel()
        setupRingtoneLabel()
        setupNoteLabel()
    }
    
    private func setupNameLabel() {
        nameLabel.text = viewModel.contact.name
        nameLabel.font = nameLabel.font.withSize(30)
    }
    
    private func setupSurnameLabel() {
        surnameLabel.text = viewModel.contact.surName
        surnameLabel.font = surnameLabel.font.withSize(30)
    }
    
    private func setupPhoneLabel() {
        phoneLabel.text = viewModel.contact.phone ?? ""
        phoneLabel.font = phoneLabel.font.withSize(17)
        
        phoneTopLabel.text = R.string.contact.phoneLAbel()
        phoneTopLabel.font = phoneTopLabel.font.withSize(15)
    }
    
    private func setupRingtoneLabel() {
        ringtoneLabel.text = viewModel.contact.ringtone ?? "Default" //ringtones[0]
        ringtoneLabel.font = ringtoneLabel.font.withSize(17)
        
        ringtoneTopLabel.text = R.string.contact.ringtoneLabel()
        ringtoneTopLabel.font = ringtoneTopLabel.font.withSize(15)
    }
    
    private func setupNoteLabel() {
        noteLabel.text = viewModel.contact.note ?? ""
        noteLabel.font = noteLabel.font.withSize(17)

        noteTopLabel.text = R.string.contact.noteLabel()
        noteTopLabel.font = noteTopLabel.font.withSize(15)
    }
    
    private func constraintsLayout() {
        view.addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.centerX.equalTo(self.view)
            make.height.width.equalTo(86)
        }
        
        let stack = UIStackView(arrangedSubviews: [nameLabel, surnameLabel])
        stack.axis = .horizontal
        stack.spacing = 10
        view.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(16)
            make.centerX.equalTo(self.view)
        }
        
        let vStact = UIStackView(arrangedSubviews: [phoneTopLabel, phoneLabel, Divider(),
                                                    ringtoneTopLabel, ringtoneLabel, Divider(),
                                                    noteTopLabel, noteLabel, Divider()])
        vStact.axis = .vertical
        vStact.spacing = 10
        view.addSubview(vStact)
        vStact.snp.makeConstraints { make in
            make.top.equalTo(stack.snp.bottom).offset(30)
            make.leading.equalTo(16)
        }
    }
    
    private func navBarButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit,
                                                            target: self,
                                                            action: #selector(editTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.systemBlue
    }
    
    @objc func editTapped() {
        viewModel.goToContactEdit()
    }
    
}
