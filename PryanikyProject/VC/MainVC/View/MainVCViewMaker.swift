//
//  MainVCViewMaker.swift
//  PryanikyProject
//
//  Created by NIKOLAI BORISOV on 08.07.2021.
//

import UIKit
import SnapKit

final class MainVCViewMaker {
  
  unowned var container: MainViewController
  
  init(container: MainViewController) {
    self.container = container
    self.container.view.addSubview(self.tableView)
  }
  
  lazy var segmentedControl: UISegmentedControl = {
    let items = [
      Constants.SegmentedControl.section0,
      Constants.SegmentedControl.section1,
      Constants.SegmentedControl.section2
    ]
    let control = UISegmentedControl(items: items)
    control.translatesAutoresizingMaskIntoConstraints = false
    control.selectedSegmentIndex = 0
    return control
  }()
  
  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
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
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.ReuseIdentifier.tableViewCell)
    tableView.tableFooterView = UIView(frame: .zero)
    tableView.delegate = self.container
    tableView.dataSource = self.container
    return tableView
  }()
  
  func setupLayouts() {
    [
      segmentedControl,
      tableView
    ]
    .forEach { container.view.addSubview($0) }
    
    segmentedControl.snp.makeConstraints { make in
      make.top.equalTo(container.view.safeAreaLayoutGuide).offset(5.0)
      make.centerX.equalToSuperview()
      make.left.equalToSuperview().offset(5.0)
      make.height.equalTo(50)
    }
    
    tableView.snp.makeConstraints { make in
      make.top.equalTo(segmentedControl.snp.bottom).offset(5.0)
      make.centerX.equalToSuperview()
      make.left.right.bottom.equalToSuperview()
    }
  }
  
}
