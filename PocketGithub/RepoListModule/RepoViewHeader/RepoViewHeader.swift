//
//  RepoViewHeader.swift
//  PocketGithub
//
//  Created by Timofey on 8/8/22.
//

import UIKit

class RepoViewHeader: UICollectionReusableView, ReuseIdProtocol {
  
  static var reuseId: String = "RepoViewHeader"
        
  private var titleLabel: UILabel!
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setupConstraints()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupElements()
  }
  
  func setTitle(title: String) {
    titleLabel.text = title
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

// MARK: - Setup UI
extension RepoViewHeader {
  
  private func setupElements() {
    setupLabel()
  }
  
  private func setupConstraints() {
    addSubview(titleLabel)
    
    let width = self.bounds.width
    
    titleLabel.snp.makeConstraints { make in
      make.horizontalEdges.equalToSuperview()
        .inset(CollectionViewLayoutFactory.LayoutConstants.horizontalPadding)
      make.centerY.equalToSuperview()
    }
  }
  
  private func setupLabel() {
    titleLabel = UILabel(
      text: "",
      fontSize: 30,
      weight: .bold,
      textColor: .white
    )
    titleLabel.textAlignment = .left
  }
  
}
