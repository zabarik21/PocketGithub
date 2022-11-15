//
//  LoginViewInteractor.swift
//  PocketGithub
//
//  Created by Timofey on 8/8/22.
//

import Foundation


class LoginViewInteractor: LoginViewInteractorInputProtocol {
  
  
  unowned var presenter: LoginViewInteractorOutputProtocol
  
  private var notifications = NotificationCenter.default
  private var authService = AuthService.shared
  
  required init(presenter: LoginViewInteractorOutputProtocol) {
    self.presenter = presenter
  }
  
  func startAuthentication() {
    DispatchQueue.global().async {
      self.authService.tryOauth()
    }
    notifications.addObserver(
      self,
      selector: #selector(authenticationsucceed),
      name: NSNotification.Name(AuthService.NotificatoinNames.loginObserverKey.rawValue),
      object: nil
    )
  }
  
  @objc func authenticationsucceed() {
    presenter.authenticatedSuccessful()
  }
  
}
