//
//  DetailsViewMaker.swift
//  PryanikyProject
//
//  Created by NIKOLAI BORISOV on 09.07.2021.
//

import UIKit
import SnapKit

final class DetailsViewMaker {
  
  unowned var container: DetailsViewController
  
  init(container: DetailsViewController) {
    self.container = container
  }
  
  lazy var thumbnailImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = Constants.Image.avatarPlaceholder
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFill
    imageView.layer.cornerRadius = 5
    imageView.layer.borderWidth = 3
    imageView.layer.borderColor = UIColor.lightGray.cgColor
    return imageView
  }()
  
  lazy var detailsLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = UIFont.nameLabelFont
    label.numberOfLines = 0
    label.textAlignment = .center
    return label
  }()
  
  func setupLayouts() {
    [
      thumbnailImageView,
      detailsLabel
    ]
    .forEach { container.view.addSubview($0) }
    
    thumbnailImageView.snp.makeConstraints { make in
      make.top.equalTo(container.view.safeAreaLayoutGuide).offset(50)
      make.centerX.equalToSuperview()
      make.height.equalTo(200.0)
      make.width.equalTo(200.0)
    }
    
    detailsLabel.snp.makeConstraints { make in
      make.top.equalTo(thumbnailImageView.snp.bottom).offset(10.0)
      make.centerX.equalToSuperview()
    }
    
  }
  
}
