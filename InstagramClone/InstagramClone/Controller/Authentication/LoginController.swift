//
//  LoginController.swift
//  InstagramClone
//
//  Created by 김시훈 on 2023/08/29.
//

import UIKit

class LoginController: UIViewController {

    // MARK: - Properties

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    // MARK: - Helpers

    func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true

        let gradient = CAGradientLayer()
    }
}
