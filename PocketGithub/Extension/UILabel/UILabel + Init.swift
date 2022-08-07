//
//  UILabel + Init.swift
//  Github Mobile
//
//  Created by Timofey on 6/8/22.
//

import UIKit


extension UILabel {
  
  convenience init(text: String, fontSize: CGFloat, weight: UIFont.Weight, textColor: UIColor) {
    self.init()
    self.text = text
    self.font = .systemFont(ofSize: fontSize, weight: weight)
    self.textColor = textColor
  }
  
}
