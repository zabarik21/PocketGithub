//
//  LoginViewController.swift
//  Github Mobile
//
//  Created by Timofey on 7/8/22.
//

import UIKit

class LoginViewController: UIViewController {
  
  private var logoView: UIImageView!
  private var formView: LoginFormView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupElements()
  }
  
}

// MARK: Setup UI
extension LoginViewController {
  
  enum Constants {
    static let horizontalLogoMult: CGFloat = 0.234
    static let horizontalFormMult: CGFloat = 0.164
    static let topLogoMult: CGFloat = 0.167
    static let topFormMult: CGFloat = 0.088
  }
  
  private func setupElements() {
    view.backgroundColor = .loginTextFieldBgColor
    setupLogo()
    setupForm()
    setupConstraints()
  }
  
  private func setupLogo() {
    logoView = UIImageView()
    logoView.image = UIImage(named: "logo")
    logoView.contentMode = .scaleAspectFit
  }
  
  private func setupForm() {
    formView = LoginFormView()
    formView.loginFormDelegate = self
  }
  
  private func setupConstraints() {
    
    let height = view.bounds.height
    let width = view.bounds.width
    let logoSide = width - width * Constants.horizontalLogoMult * 2
    
    logoView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(logoView)
    
    logoView.snp.makeConstraints { make in
      make.top
        .equalToSuperview()
        .offset(height * Constants.topLogoMult)
      make.centerX
        .equalToSuperview()
      make.height.width.equalTo(logoSide)
    }
    
    view.addSubview(formView)
    
    formView.snp.makeConstraints { make in
      make.top
        .equalTo(logoView.snp.bottom)
        .offset(height * Constants.topFormMult)
      make.horizontalEdges
        .equalToSuperview()
        .inset(width * Constants.horizontalFormMult)
    }
    
  }
  
}

extension LoginViewController: LoginFormDelegate {
  
  func signIn(login: String, password: String) {
    print("Sign in")
  }
  
}
