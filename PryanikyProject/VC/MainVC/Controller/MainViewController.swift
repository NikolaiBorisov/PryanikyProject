//
//  MainViewController.swift
//  PryanikyProject
//
//  Created by NIKOLAI BORISOV on 07.07.2021.
//

import UIKit
import RxSwift
import RxCocoa

final class MainViewController: UIViewController, UISearchControllerDelegate {
  
  private var disposeBag = DisposeBag()
  private var viewModel = MainVCModel()
  private var displayItems = [DataModelDTO.Data]() {
    didSet {
      self.viewMaker.tableView.reloadData()
    }
  }
  private lazy var viewMaker = MainVCViewMaker(container: self)
  var selectedIndex = -1
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    self.viewMaker.setupLayouts()
    self.setupNavigationBar()
    self.getPosts()
    self.setupBindings()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    handleSegmentedControlAction()
  }
  
  private func handleSegmentedControlAction() {
    self.viewMaker.segmentedControl.addTarget(
      self,
      action: #selector(onSegmentedControlTapped(_:)),
      for: .valueChanged
    )
  }
  
  @objc private func onSegmentedControlTapped(_ sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
    case 1:
      viewMaker.tableView.reloadData()
    case 2:
      viewMaker.tableView.reloadData()
    default:
      viewMaker.tableView.reloadData()
    }
  }
  
  private func setupBindings() {
    viewModel.displayItems
      .bind { [weak self] items in
        self?.displayItems = items
      }
      .disposed(by: disposeBag)
  }
  
  private func setupNavigationBar() {
    title = Constants.VCTitle.postVCTitle
    navigationItem.leftBarButtonItem = UIBarButtonItem(
      barButtonSystemItem: .cancel,
      target: self,
      action: #selector(onCloseButtonDidTap)
    )
  }
  
  private func getPosts() {
    viewModel.getInfoBlocks()
  }
  
  @objc private func onCloseButtonDidTap() {
    exit(0)
  }
  
  // MARK: - Transition Method
  
  private func presentDetailesController(for item: DataModelDTO.Data) {
    let vc = DetailsViewController()
    vc.data = item
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
}

// MARK: - TableViewDelegate & DataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch viewMaker.segmentedControl.selectedSegmentIndex {
    case 0:
      let items = self.displayItems.filter { (item) -> Bool in
        item.name == .hz
      }
      let item = items[indexPath.row]
      presentDetailesController(for: item)
    case 1:
      let items = self.displayItems.filter { (item) -> Bool in
        item.name == .selector
      }
      let item = items[indexPath.row]
      presentDetailesController(for: item)
    case 2:
      let items = self.displayItems.filter { (item) -> Bool in
        item.name == .picture
      }
      let item = items[indexPath.row]
      presentDetailesController(for: item)
    default:
      break
    }
   
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return Constants.CellRowHeight.tableViewCellRowHeight
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    switch viewMaker.segmentedControl.selectedSegmentIndex {
    case 0:
      let items = self.displayItems.filter { (item) -> Bool in
        item.name == .hz
      }
      let item = items[indexPath.row]
      (cell as? PryanikCell)?.configure(with: item)
    case 1:
      let items = self.displayItems.filter { (item) -> Bool in
        item.name == .selector
      }
      let item = items[indexPath.row]
      (cell as? PryanikCell)?.configure(with: item)
    case 2:
      let items = self.displayItems.filter { (item) -> Bool in
        item.name == .picture
      }
      let item = items[indexPath.row]
      (cell as? PryanikCell)?.configure(with: item)
    default:
      break
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch viewMaker.segmentedControl.selectedSegmentIndex {
    case 0:
      let items = self.displayItems.filter { (item) -> Bool in
        item.name == .hz
      }
      return items.count
    case 1:
      let items = self.displayItems.filter { (item) -> Bool in
        item.name == .selector
      }
      return items.count
    case 2:
      let items = self.displayItems.filter { (item) -> Bool in
        item.name == .selector
      }
      return items.count
    default:
      return 1
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch viewMaker.segmentedControl.selectedSegmentIndex {
    case 1:
      return tableView.dequeueReusableCell(withIdentifier: Constants.ReuseIdentifier.selectorTableViewCell, for: indexPath)
    case 2:
      return tableView.dequeueReusableCell(withIdentifier: Constants.ReuseIdentifier.pictureTableViewCell, for: indexPath)
    default:
      return tableView.dequeueReusableCell(withIdentifier: Constants.ReuseIdentifier.hzTableViewCell, for: indexPath)
    }
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if case .delete = editingStyle {
      self.displayItems.remove(at: indexPath.row)
      self.viewMaker.tableView.reloadData()
    }
  }
  
}
