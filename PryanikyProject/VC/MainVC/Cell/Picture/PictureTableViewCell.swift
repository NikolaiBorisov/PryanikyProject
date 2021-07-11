//
//  PictureTableViewCell.swift
//  PryanikyProject
//
//  Created by NIKOLAI BORISOV on 08.07.2021.
//

import UIKit
import Kingfisher

final class PictureTableViewCell: UITableViewCell, PryanikCell {
  
  @IBOutlet private weak var avatarImageView: UIImageView!
  @IBOutlet private weak var blockTextLabel: UILabel!
  @IBOutlet private weak var blockNameLabel: UILabel!
  
  func configure(with item: DataModelDTO.Data) {
    guard case .picture(let object) = item.data else { return }
    let blockName = item.name.rawValue.uppercased()
    self.blockNameLabel.text = Constants.LabelPlaceholder.blockName + blockName
    self.blockTextLabel.text = Constants.LabelPlaceholder.blockText + object.text
    self.avatarImageView.kf.setImage(with: object.url)
  }

}
