//
//  RepoCountView.swift
//  Github Mobile
//
//  Created by Timofey on 6/8/22.
//

import Foundation
import UIKit


enum RepoCountViewType {
  case views
  case forks
  
  fileprivate func imageName() -> String {
    switch self {
    case .views:
      return "eye"
    case .forks:
      return "forks"
    }
  }
}

class RepoCountView: UIView {
  
  private var countLabel: UILabel!
  private var countImage: UIImageView!
  
  var count: Int? {
    didSet {
      updateUI(with: count)
    }
  }
  
  var type: RepoCountViewType
  
  init(type: RepoCountViewType) {
    self.type = type
    super.init(frame: .zero)
    setupElements()
  }
  
  private func updateUI(with newCount: Int?) {
    guard let newCount = newCount else { return }
    DispatchQueue.main.async {
      if newCount > 9999 {
        self.countLabel.text = "\(9999)+"
      } else {
        self.countLabel.text = "\(newCount)"
      }
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

// MARK: Setup UI
extension RepoCountView {
  private func setupElements() {
    setupLabel()
    setupImageView()
    setupConstraints()
  }
  
  private func setupImageView() {
    countImage = UIImageView()
    countImage.image = UIImage(named: type.imageName())
    countImage.contentMode = .scaleAspectFit
  }
  
  private func setupLabel() {
    countLabel = UILabel(
      text: "0",
      fontSize: 12,
      weight: .semibold,
      textColor: .repoCellUsernameTextColor
    )
    countLabel.textAlignment = .right
  }
  
  private func setupConstraints() {
    
    addSubview(countLabel)
    
    countLabel.snp.makeConstraints { make in
      make.trailing.top.bottom.equalToSuperview()
    }
    
    addSubview(countImage)
    
    countImage.snp.makeConstraints { make in
      make.width.equalTo(22)
      make.height.equalTo(22)
      make.leading.equalToSuperview()
      make.centerY.equalToSuperview()
    }
    
  }
}
