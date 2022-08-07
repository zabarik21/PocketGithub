//
//  RepoListInterfaces.swift
//  PocketGithub
//
//  Created by Timofey on 7/8/22.
//

import Foundation


protocol RepoListInteractorOutputProtocol: AnyObject {
  func reposRecieved(_ repos: [Repo])
  func commitsRecieved(_ commits: [CommitApiResponce])
  func errorOccured(_ message: String)
}


protocol RepoListInteractorInputProtocol {
  init(presenter: RepoListInteractorOutputProtocol)
  func fetchCommits(for repo: Repo)
  func fetchRepos()
  func getRepo(at indexPath: IndexPath) -> Repo?
}

protocol RepoListViewOutputProtocol {
  init(view: RepoListViewInputProtocol)
  func viewDidLoad()
  func tapItem(at indexPath: IndexPath)
}


protocol RepoListViewInputProtocol: AnyObject {
  func updateList(_ viewModels: [RepoCellViewModel])
  func showError(_ message: String)
}

protocol RepoListRouterProtocol {
  init(viewController: RepoListViewController)
  func openCommitsViewController(with viewModels: [CommitCellViewModel])
}

protocol RepoListConfiguratorProtocol {
  func configure(with viewController: RepoListViewController)
}
