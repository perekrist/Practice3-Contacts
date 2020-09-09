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
    func initialSetup() {
        view.backgroundColor = #colorLiteral(red: 0.999904573, green: 1, blue: 0.9998722672, alpha: 1)
        navBarButtons()
        setupImageView()
        constraintsLayout()
        bindToViewModel()
    }
    
    private func bindToViewModel() {
        nameLabel.text = viewModel.contact.name
        surnameLabel.text = viewModel.contact.surName
        
        phoneLabel.text = viewModel.contact.phone ?? ""
        ringtoneLabel.text = viewModel.contact.ringtone ?? "Default" //ringtones[0]
        noteLabel.text = viewModel.contact.note ?? ""
//        avatarImageView.image = viewModel.contact.image
    }
    
    private func setupImageView() {
        avatarImageView.backgroundColor = UIColor.lightGray
    }
    
    private func constraintsLayout() {
        view.addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalTo(49)
        }
        
        let stack = UIStackView(arrangedSubviews: [nameLabel, surnameLabel])
        stack.axis = .vertical
        view.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(16)
            make.leading.equalTo(49)
        }
        
        let vStact = UIStackView(arrangedSubviews: [phoneLabel, ringtoneLabel, noteLabel])
        stack.axis = .horizontal
        
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
        
    }
    
}
