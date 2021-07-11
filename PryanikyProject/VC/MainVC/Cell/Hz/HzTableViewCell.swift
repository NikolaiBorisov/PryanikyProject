//
//  HzTableViewCell.swift
//  PryanikyProject
//
//  Created by NIKOLAI BORISOV on 08.07.2021.
//

import UIKit

final class HzTableViewCell: UITableViewCell, PryanikCell {
  
  @IBOutlet weak var blockName: UILabel!
  @IBOutlet private weak var nameLabel: UILabel!
  
  func configure(with item: DataModelDTO.Data) {
    guard case .text(let object) = item.data else { return }
    let blockName = item.name.rawValue.uppercased()
    self.blockName.text = Constants.LabelPlaceholder.blockName + blockName
    self.nameLabel.text = Constants.LabelPlaceholder.blockText + object.text
  }
  
}
