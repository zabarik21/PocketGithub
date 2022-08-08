//
//  CommitsListCollectionView.swift
//  PocketGithub
//
//  Created by Timofey on 7/8/22.
//

import Foundation
import UIKit




class CommitsListCollectionView: UICollectionViewController {
  
  private enum CommitsListConstnts {
    static let headerTitle = "Commits"
    static let headerHeight: CGFloat = 100
  }
  
  public var viewModels = [CommitCellViewModel]() {
    didSet {
      self.collectionView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
  }
  
  private func setupCollectionView() {
    collectionView.backgroundColor = .githubBg
    collectionView.register(CommitCell.self, forCellWithReuseIdentifier: CommitCell.reuseId)
    collectionView.register(
      RepoViewHeader.self,
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
      withReuseIdentifier: RepoViewHeader.reuseId
    )
  }
  
}

// MARK: - DataSource
extension CommitsListCollectionView: UICollectionViewDelegateFlowLayout {
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommitCell.reuseId, for: indexPath) as? CommitCell else {
      return UICollectionViewCell()
    }
    return cell
  }
  
  override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    DispatchQueue.main.async {
      if let commitCell = cell as? CommitCell {
        commitCell.viewModel = self.viewModels[indexPath.row]
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


// MARK: Header setup
extension CommitsListCollectionView {
  
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if kind == UICollectionView.elementKindSectionHeader {
      guard let header = collectionView.dequeueReusableSupplementaryView(
        ofKind: kind,
        withReuseIdentifier: RepoViewHeader.reuseId,
        for: indexPath
      ) as? RepoViewHeader else { return UICollectionReusableView() }
      header.setTitle(title: CommitsListConstnts.headerTitle)
      return header
    }
    return UICollectionReusableView()
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: view.bounds.width, height: CommitsListConstnts.headerHeight)
  }

}
