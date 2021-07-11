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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    AlamofireService.shared.getBlocksOfInfo {
      print("JSON")
    }
    self.setupNavigationBar()
    self.getPosts()
    self.setupBindings()
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
    let item = displayItems[indexPath.row]
    presentDetailesController(for: item)
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return Constants.CellRowHeight.tableViewCellRowHeight
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    let item = displayItems[indexPath.row]
    (cell as? PryanikCell)?.configure(with: item)
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return displayItems.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let item = displayItems[indexPath.row]
    switch item.name {
    case .picture:
      return tableView.dequeueReusableCell(withIdentifier: Constants.ReuseIdentifier.pictureTableViewCell, for: indexPath)
    case .hz:
      return tableView.dequeueReusableCell(withIdentifier: Constants.ReuseIdentifier.hzTableViewCell, for: indexPath)
    case .selector:
      return tableView.dequeueReusableCell(withIdentifier: Constants.ReuseIdentifier.selectorTableViewCell, for: indexPath)
    }
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if case .delete = editingStyle {
      self.displayItems.remove(at: indexPath.row)
      self.viewMaker.tableView.reloadData()
    }
  }
  
}
