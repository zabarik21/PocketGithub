//
//  LoginViewConfigurator.swift
//  PocketGithub
//
//  Created by Timofey on 8/8/22.
//

import Foundation

protocol LoginViewConfiguratorProtocol {
  func configure(with viewConttoller: LoginViewController)
}

class LoginViewConfigurator: LoginViewConfiguratorProtocol {
  
  func configure(with viewConttoller: LoginViewController) {
    let presenter = LoginViewPresenter(view: viewConttoller)
    let router = LoginViewRouter()
    let interactor = LoginViewInteractor(presenter: presenter)
    
    presenter.router = router
    presenter.interactor = interactor
    viewConttoller.presenter = presenter
  }
  
  
}
