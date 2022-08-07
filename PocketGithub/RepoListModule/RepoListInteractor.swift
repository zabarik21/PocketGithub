//
//  RepoListInteractor.swift
//  PocketGithub
//
//  Created by Timofey on 7/8/22.
//

import Foundation


class RepoListInteractor: RepoListInteractorInputProtocol {
  
  unowned var presenter: RepoListInteractorOutputProtocol
  
  var repos = [Repo]()
  
  required init(presenter: RepoListInteractorOutputProtocol) {
    self.presenter = presenter
  }
  
  func fetchRepos() {
    GitHubApi.shared.fetchRepos { result in
      switch result {
      case .success(let repos):
        let reversed = Array(repos.reversed())
        self.repos = reversed
        self.presenter.reposRecieved(reversed)
      case .failure(let error):
        self.presenter.errorOccured(error.localizedDescription)
      }
    }
    
  }
  
  func getRepo(at indexPath: IndexPath) -> Repo? {
    guard indexPath.row < repos.count else {
      presenter.errorOccured("wrong cell touched")
      return nil
    }
    return repos[indexPath.row]
  }
  
  func fetchCommits(for repo: Repo) {
    GitHubApi.shared.fetchCommits(for: repo) { result in
      switch result {
      case .success(let commits):
        self.presenter.commitsRecieved(commits)
      case .failure(let error):
        self.presenter.errorOccured(error.localizedDescription)
      }
    }
  }
  
}
