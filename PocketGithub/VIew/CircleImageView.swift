//
//  CircleImageView.swift
//  Github Mobile
//
//  Created by Timofey on 7/8/22.
//

import UIKit


class CircleImageView: UIImageView {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    let height = self.bounds.height
    layer.cornerRadius = height / 2
  }
  
  required init() {
    super.init(frame: .zero)
    layer.masksToBounds = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
