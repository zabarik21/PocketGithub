//
//  CommitCell.swift
//  PocketGithub
//
//  Created by Timofey on 7/8/22.
//

import Foundation
import UIKit

class CommitCell: UICollectionViewCell, ReuseIdProtocol {
  
  static var reuseId: String = "CommitCell"
  
  private var descriptionLabel: UILabel!
  private var usernameLabel: UILabel!
  private var hashLabel: UILabel!
  private var dateLabel: UILabel!
  
  var viewModel: CommitCellViewModel? {
    didSet {
      updateUI(with: viewModel)
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupElements()
    layer.cornerRadius = 5
    backgroundColor = .repoCellBg
  }
  
  func updateUI(with viewModel: CommitCellViewModel?) {
    guard let viewModel = viewModel else { return }
    DispatchQueue.main.async {
      self.descriptionLabel.text = viewModel.description
      self.usernameLabel.text = viewModel.username
      self.dateLabel.text = viewModel.date
      self.hashLabel.text = viewModel.hash
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

// MARK: SetupUI
extension CommitCell {
  
  private func setupElements() {
    setupLabels()
    setupConstraints()
  }
  
  private func setupLabels() {
    descriptionLabel = UILabel(
      text: "Commit message",
      fontSize: 14,
      weight: .semibold,
      textColor: .white
    )
    
    usernameLabel = UILabel(
      text: "Username",
      fontSize: 15,
      weight: .semibold,
      textColor: .repoCellUsernameTextColor
    )
    
    
    dateLabel = UILabel(
      text: "02.02.02",
      fontSize: 12,
      weight: .semibold,
      textColor: .repoCellUsernameTextColor
    )
    
    hashLabel = UILabel(
      text: "hhhhhh",
      fontSize: 12,
      weight: .semibold,
      textColor: .repoCellUsernameTextColor
    )
  }
  
  
  private func setupConstraints() {
   
    addSubview(usernameLabel)
    
    usernameLabel.snp.makeConstraints { make in
      make.leading
        .equalToSuperview()
        .offset(12)
      make.bottom
        .equalToSuperview()
        .offset(-12)
    }
    
    addSubview(descriptionLabel)
    
    descriptionLabel.snp.makeConstraints { make in
      make.top
        .equalToSuperview()
        .offset(12)
      make.horizontalEdges
        .equalToSuperview()
        .inset(12)
    }
    
    let hashDataStack = UIStackView(arrangedSubviews: [
      dateLabel,
      hashLabel
    ])
    
    hashDataStack.axis = .horizontal
    hashDataStack.spacing = 14
    hashDataStack.distribution = .equalSpacing
    
    addSubview(hashDataStack)
    
    hashDataStack.snp.makeConstraints { make in
      make.trailing
        .equalToSuperview()
        .offset(-12)
      make.bottom
        .equalToSuperview()
        .offset(-12)
    }
  }
}
