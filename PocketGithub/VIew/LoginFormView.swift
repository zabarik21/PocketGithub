//
//  LoginFormView.swift
//  Github Mobile
//
//  Created by Timofey on 7/8/22.
//

import UIKit


protocol LoginFormDelegate: AnyObject {
  func signIn(login: String, password: String)
}

class LoginFormView: UIView {
  
  private var loginTextField: LoginTextField!
  private var passwordTextField: LoginTextField!
  private var signInButton: UIButton!
  
  weak var loginFormDelegate: LoginFormDelegate?
  
  required init() {
    super.init(frame: .zero)
    setupElements()
    signInButton.addTarget(self, action: #selector(signInTouched), for: .touchUpInside)
  }
  
  @objc func signInTouched() {
    let errors = Validator.isFilled(
      email: loginTextField.text,
      password: passwordTextField.text
    )
    
    if errors.isEmpty {
      loginFormDelegate?.signIn(
        login: loginTextField.text,
        password: passwordTextField.text
      )
    } else {
      for error in errors {
        switch error {
        case .email:
          loginTextField.twitch()
        case .password:
          passwordTextField.twitch()
        }
      }
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}


// MARK: Setup UI
extension LoginFormView {
  
  private func setupElements() {
    self.backgroundColor = .loginFormBg
    self.layer.cornerRadius = 5
    setupTextFields()
    setupButton()
    setupConstraints()
  }
  
  private func setupButton() {
    signInButton = UIButton(type: .system)
    signInButton.backgroundColor = .signInButtonColor
    signInButton.layer.cornerRadius = 5
    signInButton.setTitle("Sign in", for: .normal)
    signInButton.setTitleColor(.white, for: .normal)
  }
  
  private func setupTextFields() {
    loginTextField = LoginTextField(type: .login)
    passwordTextField = LoginTextField(type: .password)
  }
  
  private func setupConstraints() {
    
    addSubview(signInButton)
    
    signInButton.snp.makeConstraints { make in
      make.horizontalEdges
        .equalToSuperview()
        .inset(18)
      make.height.equalTo(30)
      make.bottom
        .equalToSuperview()
        .offset(-16)
    }
    
    let textFieldsStack = UIStackView(arrangedSubviews: [
      loginTextField,
      passwordTextField
    ])
    
    textFieldsStack.axis = .vertical
    textFieldsStack.spacing = 14
    textFieldsStack.distribution = .equalSpacing
    
    
    addSubview(textFieldsStack)
    
    
    textFieldsStack.snp.makeConstraints { make in
      make.top
        .equalToSuperview()
        .offset(12)
      make.horizontalEdges
        .equalToSuperview()
        .inset(18)
      make.bottom
        .equalTo(signInButton.snp.top)
        .offset(-16)
    }
  }
  
}

