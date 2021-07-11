//
//  Constants.swift
//  PryanikyProject
//
//  Created by NIKOLAI BORISOV on 07.07.2021.
//

import UIKit

enum Constants {
  
  enum Nib {
    static let pictureTableViewCell: UINib = .init(nibName: "PictureTableViewCell", bundle: nil)
    static let hzTableViewCell: UINib = .init(nibName: "HzTableViewCell", bundle: nil)
    static let selectorTableViewCell: UINib = .init(nibName: "SelectorTableViewCell", bundle: nil)
  }
  
  // api: https://pryaniky.com/static/json/sample.json
  
  enum API {
    static let scheme = "https"
    static let host = "pryaniky.com"
    static let path = "/static/json/sample.json"
    static let api = "https://pryaniky.com/static/json/sample.json"
  }
  
  enum TimeConstants {
    static let requestTimeoutInterval: Double = 10.0
  }
  
  enum Image {
    static let avatarPlaceholder: UIImage? = UIImage(named: "photo")
  }
  
  enum NSCoder {
    static let fatalError = "init(coder:) has not been implemented"
  }
  
  enum ReuseIdentifier {
    static let pictureTableViewCell = "PictureTableViewCell"
    static let hzTableViewCell = "HzTableViewCell"
    static let selectorTableViewCell = "SelectorTableViewCell"
  }
  
  enum CellRowHeight {
    static let tableViewCellRowHeight: CGFloat = 70.0
  }
  
  enum VCTitle {
    static let postVCTitle = "Feed"
    static let detailsVCTitle = "Details Info"
  }
  
  enum LabelPlaceholder {
    static let blockName = "Block name: "
    static let selectedId = "Selected Id: "
    static let blockText = "Block text: "
  }
  
}
