//
//  ResetPasswordController.swift
//  InstagramClone
//
//  Created by 김시훈 on 1/3/24.
//

import UIKit

class ResetPasswordController: UIViewController {

    // MARK: - Properties

    private let emailTextField = CustomTextField(placeholder: "Email")
    private var viewModel = ResetPasswordViewModel()

    private let iconImage: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "Instagram_logo_white"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()

    private var resetPasswordButton: UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Reset Password", for: .normal)
        button.setTitleColor(UIColor(white: 1, alpha: 0.7), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
        button.layer.cornerRadius = 5
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.isEnabled = true
        button.addTarget(self, action: #selector(handleResetPassword), for: .touchUpInside)
        print("리셋패스워드 버튼 초기화 타이밍")
        return button
    }

    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Actions

    @objc func handleResetPassword() {
        print("리셋 패스워드 버튼 눌림")
    }

    @objc func textDidChange(sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        }

        updateForm()
    }

    @objc func handleDismissal() {
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Helpers

    func configureUI() {
        configureGradienLayer()

        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)

        view.addSubview(backButton)
        backButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 16, paddingLeft: 16)

        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 80, width: 120)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)

        let stack = UIStackView(arrangedSubviews: [emailTextField, resetPasswordButton])
        stack.axis = .vertical
        stack.spacing = 20

        view.addSubview(stack)
        stack.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor,
                     right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)

        resetPasswordButton.titleLabel?.text = "도대체 왜 안되는 거임??"
    }
}

// MARK: - FormViewModel

extension ResetPasswordController: FormViewModel {
    func updateForm() {
        resetPasswordButton.setTitle("왜", for: .normal)
        print("업데이트 백그라운드 컬러")
        resetPasswordButton.backgroundColor = viewModel.buttonBackgroundColor
        print("업데이트 백그라운드 타이틀컬러")
        resetPasswordButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        print("업데이트 조작가능")
        resetPasswordButton.isEnabled = viewModel.formIsValid
        print("업데이트 폼")
    }
}
