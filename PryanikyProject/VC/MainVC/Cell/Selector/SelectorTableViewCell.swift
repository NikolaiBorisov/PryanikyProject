//
//  SelectorTableViewCell.swift
//  PryanikyProject
//
//  Created by NIKOLAI BORISOV on 08.07.2021.
//

import UIKit

final class SelectorTableViewCell: UITableViewCell, PryanikCell {

  @IBOutlet private weak var idLabel: UILabel!
  @IBOutlet weak var blockName: UILabel!
  
  func configure(with item: DataModelDTO.Data) {
    guard case .selector(let object) = item.data else { return }
    let blockName = item.name.rawValue.uppercased()
    self.blockName.text = Constants.LabelPlaceholder.blockName + blockName
    self.idLabel.text = Constants.LabelPlaceholder.selectedId + String(object.selectedId)
  }
  
}
