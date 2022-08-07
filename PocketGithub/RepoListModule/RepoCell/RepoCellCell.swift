//
//  RepoCellTableViewCell.swift
//  Github Mobile
//
//  Created by Timofey on 6/8/22.
//

import UIKit
import SnapKit
import Kingfisher

protocol ReuseIdProtocol {
  static var reuseId: String { get }
}

class RepoCellCell: UICollectionViewCell, ReuseIdProtocol {
  
  static var reuseId: String = "RepoCellTableViewCell"
  
  private var userImageView: UIImageView!
  private var usernameLabel: UILabel!
  private var reponameLabel: UILabel!
  private var descriptionLabel: UILabel!
  private var forksCountView: RepoCountView!
  private var viewsCountView: RepoCountView!
  
  public var viewModel: RepoCellViewModel? {
    didSet {
      updateUI(with: viewModel)
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .repoCellBg
    layer.cornerRadius = 5
    setupElements()
  }
  
  private func updateUI(with viewModel: RepoCellViewModel?) {
    guard let viewModel = viewModel else { return }
    DispatchQueue.main.async {
      self.forksCountView.count = viewModel.forksCount
      self.viewsCountView.count = viewModel.viewsCount
      self.reponameLabel.text = viewModel.reponame
      self.descriptionLabel.text = viewModel.repoDescription
      self.usernameLabel.text = viewModel.username
      guard let url = URL(string: viewModel.userImageString) else { return }
      self.userImageView.kf.setImage(with: url)
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}

// MARK: Setup UI
extension RepoCellCell {
  
  private func setupElements() {
    setupLabels()
    setupImageView()
    setupCountViews()
    setupConstraints()
  }
  
  private func setupCountViews() {
    viewsCountView = RepoCountView(type: .views)
    forksCountView = RepoCountView(type: .forks)
  }
  
  private func setupImageView() {
    userImageView = CircleImageView()
    userImageView.backgroundColor = .white
    userImageView.contentMode = .scaleAspectFit
  }
  
  private func setupLabels() {
    usernameLabel = UILabel(
      text: "Repo owner",
      fontSize: 15,
      weight: .semibold,
      textColor: .repoCellUsernameTextColor)
    
    reponameLabel = UILabel(
      text: "Repo",
      fontSize: 14,
      weight: .semibold,
      textColor: .white
    )
    descriptionLabel = UILabel(
      text: "Description",
      fontSize: 14,
      weight: .semibold,
      textColor: .repoCellDescriptionTextColor
    )
    descriptionLabel.numberOfLines = 2
  }
  
  private func setupConstraints() {
    
    userImageView.snp.makeConstraints { make in
      make.height.width.equalTo(25)
    }
    
    let nameImageStack = UIStackView(arrangedSubviews: [
      userImageView,
      usernameLabel
    ])
    
    nameImageStack.axis = .horizontal
    nameImageStack.spacing = 10
    nameImageStack.alignment = .center
    nameImageStack.distribution = .equalSpacing
    
    addSubview(nameImageStack)
    
    nameImageStack.snp.makeConstraints { make in
      make.top
        .equalToSuperview()
        .offset(12)
      make.horizontalEdges
        .equalToSuperview()
        .inset(12)
    }
    
    let repoNameDescriptionStack = UIStackView(arrangedSubviews: [
      reponameLabel,
      descriptionLabel
    ])
    
    repoNameDescriptionStack.axis = .vertical
    repoNameDescriptionStack.alignment = .leading
    
    addSubview(repoNameDescriptionStack)
    
    repoNameDescriptionStack.snp.makeConstraints { make in
      make.top
        .equalTo(nameImageStack.snp.bottom)
        .offset(6)
      make.horizontalEdges
        .equalToSuperview()
        .inset(12)
    }
    
    
    
    addSubview(viewsCountView)
    
    viewsCountView.snp.makeConstraints { make in
      make.trailing
        .equalToSuperview()
        .offset(-12)
      make.bottom
        .equalToSuperview()
        .offset(-8)
      make.height.equalTo(20)
      make.width.equalTo(50)
    }
    
    addSubview(forksCountView)
    
    forksCountView.snp.makeConstraints { make in
      make.trailing
        .equalTo(viewsCountView.snp.leading)
        .offset(-12)
      make.bottom
        .equalToSuperview()
        .offset(-8)
      make.height.equalTo(20)
      make.width.equalTo(50)
    }
  }
  
}
