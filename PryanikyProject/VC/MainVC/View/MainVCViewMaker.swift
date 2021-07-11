//
//  MainVCViewMaker.swift
//  PryanikyProject
//
//  Created by NIKOLAI BORISOV on 08.07.2021.
//

import UIKit

final class MainVCViewMaker {
  
  unowned var container: MainViewController
  
  init(container: MainViewController) {
    self.container = container
    self.container.view.addSubview(self.tableView)
  }
  
  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.register(
      Constants.Nib.pictureTableViewCell,
      forCellReuseIdentifier: Constants.ReuseIdentifier.pictureTableViewCell
    )
    tableView.register(
      Constants.Nib.hzTableViewCell,
      forCellReuseIdentifier: Constants.ReuseIdentifier.hzTableViewCell
    )
    tableView.register(
      Constants.Nib.selectorTableViewCell,
      forCellReuseIdentifier: Constants.ReuseIdentifier.selectorTableViewCell
    )
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.frame = self.container.view.frame
    tableView.delegate = self.container
    tableView.dataSource = self.container
    return tableView
  }()
  
}
