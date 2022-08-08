//
//  MainNavigationController.swift
//  PocketGithub
//
//  Created by Timofey on 7/8/22.
//

import Foundation
import UIKit


class MainNavigationController: UINavigationController {
  
  
  required  override init(rootViewController: UIViewController) {
    super.init(rootViewController: rootViewController)
    setupNavigationBar()
  }
  
  override init(nibName: String?, bundle: Bundle?) {
    super.init(nibName: nil, bundle: nil)
  }
  
  private func setupNavigationBar() {
    navigationBar.tintColor = .white
    navigationBar.shadowImage = UIImage()
    navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationBar.isTranslucent = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}


