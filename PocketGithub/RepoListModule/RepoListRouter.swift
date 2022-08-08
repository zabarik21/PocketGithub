//
//  RepoListRouter.swift
//  PocketGithub
//
//  Created by Timofey on 7/8/22.
//

import Foundation
import UIKit

class RepoListViewRouter: RepoListRouterProtocol {
  
  unowned let viewController: RepoListViewController
  
  
  required init(viewController: RepoListViewController) {
    self.viewController = viewController
  }
  
  func openCommitsViewController(with viewModels: [CommitCellViewModel]) {
    DispatchQueue.main.async {
      guard let windowBounds = UIApplication.shared.windows.first?.bounds else { return }
      DispatchQueue.main.async {
        let commitsViewController = CommitsListCollectionView(collectionViewLayout: CollectionViewLayoutFactory.shared.getCommitsListLayout(windowBounds: windowBounds))
        self.viewController.navigationController?.pushViewController(commitsViewController, animated: true)
        commitsViewController.viewModels = viewModels
    }
    }
  }
  
}
