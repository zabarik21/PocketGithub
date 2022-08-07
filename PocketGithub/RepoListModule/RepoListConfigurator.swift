//
//  RepoListConfigurator.swift
//  PocketGithub
//
//  Created by Timofey on 7/8/22.
//

import Foundation


class RepoListConfigurator: RepoListConfiguratorProtocol {
  
  func configure(with viewController: RepoListViewController) {
    let presenter = RepoListPresenter(view: viewController)
    let interactor = RepoListInteractor(presenter: presenter)
    let router = RepoListViewRouter(viewController: viewController)
    
    viewController.presenter = presenter
    presenter.interactor = interactor
    presenter.router = router
  }
  
}
