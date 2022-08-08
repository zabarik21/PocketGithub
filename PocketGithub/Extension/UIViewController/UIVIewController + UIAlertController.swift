//
//  UIVIewController + UIAlertController.swift
//  PocketGithub
//
//  Created by Timofey on 8/8/22.
//

import Foundation
import UIKit



extension UIViewController {
  
  func showAlertController(
    title: String,
    message: String,
    style: UIAlertController.Style
  ) {
    let alertController = UIAlertController(
      title: title,
      message: message,
      preferredStyle: style
    )
    
    let action = UIAlertAction(
      title: "Close",
      style: .default,
      handler: nil
    )
    
    alertController.addAction(action)
    
    self.present(alertController, animated: true, completion: nil)
  }
  
}
