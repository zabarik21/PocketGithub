//
//  LoginViewInterfaces.swift
//  PocketGithub
//
//  Created by Timofey on 8/8/22.
//

import Foundation


protocol LoginViewRouterProtocol: AnyObject {
  func toRepoList()
}

protocol LoginViewInputProtocol: AnyObject {
  func showAlert(with title: String, message: String)
}

protocol LoginViewOutputProtocol: AnyObject {
  func loginButtonTouched()
  init(view: LoginViewInputProtocol)
}

protocol LoginViewInteractorOutputProtocol: AnyObject {
  init(view: LoginViewInputProtocol)
  func authenticatedSuccessful()
  func authenticatedFailedWithError(_ error: Error)
}

protocol LoginViewInteractorInputProtocol: AnyObject {
  func startAuthentication()
  init(presenter: LoginViewInteractorOutputProtocol)
}



