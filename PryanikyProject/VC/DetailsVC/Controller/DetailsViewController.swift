//
//  DetailsViewController.swift
//  PryanikyProject
//
//  Created by NIKOLAI BORISOV on 07.07.2021.
//

import UIKit
import Kingfisher

final class DetailsViewController: UIViewController {
  
  var data: DataModelDTO.Data?
  private lazy var viewmaker = DetailsViewMaker(container: self)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    title = Constants.VCTitle.detailsVCTitle
    viewmaker.setupLayouts()
    handleDataElements()
  }
  
  // MARK: - Display the Data According the Tapped Cell
  
  private func handleDataElements() {
    guard let data = self.data else { return }
    switch data.data {
    case .picture(let item):
      self.viewmaker.detailsLabel.text = item.text
      self.viewmaker.thumbnailImageView.kf.setImage(with: item.url)
    case .text(let item):
      self.viewmaker.detailsLabel.text = item.text
    case .selector(let item):
      self.viewmaker.detailsLabel.text = item.variants.reduce(into: "", { (result, value) in
        result += "\(value)\n"
      })
    default:
      break
    }
  }
  
}
