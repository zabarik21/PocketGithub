//
//  SignUpTextField.swift
//  Github Mobile
//
//  Created by Timofey on 7/8/22.
//

import Foundation
import UIKit

enum SignUpTextFieldType {
  case login
  case password
  
  func titleText() -> String {
    switch self {
    case .login:
      return "Username or email address"
    case .password:
      return "Password"
    }
  }
 
  func keyboardType() -> UIKeyboardType {
    switch self {
    case .login:
      return .emailAddress
    case .password:
      return .default
    }
  }
}

class LoginTextField: UIView {

  private enum Constants {
    static let textFieldHeight: CGFloat = 33
  }
  
  private var textField: UITextField!
  private var label: UILabel!
  
  private var type: SignUpTextFieldType
  
  public var text: String = ""
  
  init(type: SignUpTextFieldType) {
    self.type = type
    super.init(frame: .zero)
    setupElements()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

// MARK: - Setup Elements & Constraints
extension LoginTextField {
  
  private func setupElements() {
    setupTextField()
    setupLabel()
    setupConstraints()
  }
  
  private func setupTextField() {
    let placeHolder = NSAttributedString(
      string: "",
      attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
    
    textField = PaddingTextField(
      insets: UIEdgeInsets(
        top: 0,
        left: 10,
        bottom: 0,
        right: 10),
      placeHolder: placeHolder,
      textColor: .white,
      keyboardType: type.keyboardType(),
      font: .systemFont(
        ofSize: 16,
        weight: .semibold))
    
    textField.layer.borderColor = UIColor.loginTextFieldBorderColor.cgColor
    textField.backgroundColor = .loginTextFieldBgColor
    textField.layer.cornerRadius = 5
    
    textField.delegate = self
  }
  
  private func setupLabel() {
    label = UILabel(
      text: type.titleText(),
      fontSize: 16,
      weight: .semibold,
      textColor: .repoCellDescriptionTextColor
    )
  }
  
  private func setupConstraints() {
    addSubview(label)
    addSubview(textField)
    
    label.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.leading.equalToSuperview()
    }
    
    textField.snp.makeConstraints { make in
      make.top.equalTo(label.snp.bottom).offset(8)
      make.horizontalEdges.equalToSuperview()
      make.bottom.equalToSuperview()
      make.height.equalTo(Constants.textFieldHeight)
    }
  }
}

// MARK: TextFieldDelegate
extension LoginTextField: UITextFieldDelegate {
  
  func textFieldDidChangeSelection(_ textField: UITextField) {
    self.text = textField.text ?? ""
  }
  
}
