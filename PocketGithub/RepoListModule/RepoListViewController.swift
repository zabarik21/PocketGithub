//
//  RepoListViewController.swift
//  PocketGithub
//
//  Created by Timofey on 7/8/22.
//

import Foundation
import UIKit


class RepoListViewController: UICollectionViewController {
 
  private let configurator = RepoListConfigurator()
  var presenter: RepoListViewOutputProtocol!
  
  private var viewModels = [RepoCellViewModel]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configurator.configure(with: self)
    setupCollectionView()
    presenter.viewDidLoad()
  }
  
  private func setupCollectionView() {
    collectionView.backgroundColor = .githubBg
    collectionView.register(RepoCellCell.self, forCellWithReuseIdentifier: RepoCellCell.reuseId)
  }
  
}

extension RepoListViewController: RepoListViewInputProtocol {
  
  func updateList(_ viewModels: [RepoCellViewModel]) {
    self.viewModels = viewModels
    self.collectionView.reloadData()
  }
  
  func showError(_ message: String) {
    print(message)
  }
  
}

// MARK: DataSource
extension RepoListViewController {
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    presenter.tapItem(at: indexPath)
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RepoCellCell.reuseId, for: indexPath) as? RepoCellCell else {
      return UICollectionViewCell()
    }
    return cell
  }
  
  override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    DispatchQueue.main.async {
      if let repoCell = cell as? RepoCellCell {
        repoCell.viewModel = self.viewModels[indexPath.row]
      }
    }
  }
 
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModels.count
  }

  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
}

extension RepoListViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.bounds.width - 15 * 2
    return CGSize(width: width, height: 140)
  }
}
