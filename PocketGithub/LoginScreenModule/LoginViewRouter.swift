//
//  LoginViewRouter.swift
//  PocketGithub
//
//  Created by Timofey on 8/8/22.
//

import Foundation
import UIKit


class LoginViewRouter: LoginViewRouterProtocol {
  
  func toRepoList() {
    DispatchQueue.main.async {
      guard let windowBounds = UIApplication.shared.windows.first?.bounds else { return }
      let layout = CollectionViewLayoutFactory.shared.getReposListLayout(windowBounds: windowBounds)
      let repoListViewController = RepoListViewController(collectionViewLayout: layout)
      let mainRepoScreen = MainNavigationController(rootViewController: repoListViewController)
      UIApplication.shared.windows.first?.rootViewController = mainRepoScreen
      UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
  }
  
}
