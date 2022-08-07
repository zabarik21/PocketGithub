//
//  RepoListPresenter.swift
//  PocketGithub
//
//  Created by Timofey on 7/8/22.
//

import Foundation
import Alamofire


class RepoListPresenter: RepoListViewOutputProtocol {
  
  unowned let view: RepoListViewInputProtocol
  var interactor: RepoListInteractorInputProtocol!
  var router: RepoListViewRouter!
  
  required init(view: RepoListViewInputProtocol) {
    self.view = view
  }
  
  func viewDidLoad() {
    interactor.fetchRepos()
  }
  
  func tapItem(at indexPath: IndexPath) {
    guard let repo = interactor.getRepo(at: indexPath) else { return }
    interactor.fetchCommits(for: repo)
  }

}

extension RepoListPresenter: RepoListInteractorOutputProtocol {
  
  func commitsRecieved(_ commits: [CommitApiResponce]) {
    let viewModels = commits.map { CommitCellViewModel(
      date: String($0.commit.committer.date.prefix(10)),
      hash: String($0.sha.prefix(6)),
      description: $0.commit.message,
      username: $0.commit.committer.name)
    }
    router.openCommitsViewController(with: viewModels)
  }
  
  func reposRecieved(_ repos: [Repo]) {
    let viewModels: [RepoCellViewModel] = repos.map {
      RepoCellViewModel(
        reponame: $0.name,
        username: $0.owner.login,
        repoDescription: $0.description ?? "",
        userImageString: $0.owner.avatar_url,
        forksCount: $0.forks,
        viewsCount: $0.watchers
      )
    }
    view.updateList(viewModels)
  }
  
  func errorOccured(_ message: String) {
    view.showError(message)
  }
  
}

