//
//  CollectoinViewLayoutFactory.swift
//  PocketGithub
//
//  Created by Timofey on 7/8/22.
//

import Foundation
import UIKit


class CollectionViewLayoutFactory {
  
  static let shared = CollectionViewLayoutFactory()
  
  func getReposListLayout(windowBounds: CGRect) -> UICollectionViewFlowLayout {
    let layout = UICollectionViewFlowLayout()
    let width = windowBounds.width - 15 * 2
    
    layout.scrollDirection = .vertical
    layout.minimumInteritemSpacing = 20
    layout.itemSize = CGSize(width: width, height: 140)

    return layout
  }
  
  func getCommitsListLayout(windowBounds: CGRect) -> UICollectionViewFlowLayout {
    let layout = UICollectionViewFlowLayout()
    let width = windowBounds.width - 15 * 2
    
    layout.scrollDirection = .vertical
    layout.minimumInteritemSpacing = 8
    layout.itemSize = CGSize(width: width, height: 80)

    return layout
  }
}
