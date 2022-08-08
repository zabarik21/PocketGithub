//
//  LoginViewPresenter.swift
//  PocketGithub
//
//  Created by Timofey on 8/8/22.
//

import Foundation


class LoginViewPresenter: LoginViewOutputProtocol {
  
  unowned var view: LoginViewInputProtocol
  var interactor: LoginViewInteractorInputProtocol!
  var router: LoginViewRouter!
  
  required init(view: LoginViewInputProtocol) {
    self.view = view
  }
  
  func loginButtonTouched() {
    interactor.startAuthentication()
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
      self.view.showAlert(
        with: "Please wait",
        message: "You will be logged in a few seconds"
      )
    }
  }
}

extension LoginViewPresenter: LoginViewInteractorOutputProtocol {
  
  func authenticatedSuccessful() {
    router.toRepoList()
  }
  
  func authenticatedFailedWithError(_ error: Error) {
    view.showAlert(with: "Error occured", message: error.localizedDescription)
  }
  
}
