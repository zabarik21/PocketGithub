//
//  LoginViewController.swift
//  Github Mobile
//
//  Created by Timofey on 7/8/22.
//

import UIKit
import OAuthSwift


class LoginViewController: UIViewController {
  
  private var logoView: UIImageView!
  private var signInButton: UIButton!
  
  public var authService = AuthService.shared
  
  var presenter: LoginViewOutputProtocol!
  private var configurator = LoginViewConfigurator()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupElements()
    configurator.configure(with: self)
    signInButton.addTarget(self, action: #selector(signInTouched), for: .touchUpInside)
  }
  
  @objc private func signInTouched() {
    presenter.loginButtonTouched()
  }
  
}

// MARK: - LoginViewInputProtocol
extension LoginViewController: LoginViewInputProtocol {
  
  func showAlert(with title: String, message: String) {
    self.showAlertController(
      title: title,
      message: message,
      style: .alert
    )
  }
  
}

// MARK: - Setup UI
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
  
  private func setupLogo() {
    logoView = UIImageView()
    logoView.image = UIImage(named: "logo")
    logoView.contentMode = .scaleAspectFit
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
    
    view.addSubview(signInButton)
    
    signInButton.snp.makeConstraints { make in
      
      make.top
        .equalTo(logoView.snp.bottom)
        .offset(height * Constants.topFormMult)
      make.height.equalTo(30)
      make.centerX.equalToSuperview()
      make.width
        .equalTo(logoView)
        .offset(30)
    }
    
  }
  
}
