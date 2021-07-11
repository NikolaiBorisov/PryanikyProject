//
//  MainVCModel.swift
//  PryanikyProject
//
//  Created by NIKOLAI BORISOV on 07.07.2021.
//

import Foundation
import RxSwift
import RxCocoa

final class MainVCModel {
  
  var displayItems = PublishSubject<[DataModelDTO.Data]>()
  
  //MARK: - Get InfoBlocks
  
  func getInfoBlocks() {
    let request = GetDataRequest()
    NetworkManager.shared.request(request: request) { [weak self] completion in
      switch completion {
      case .failure(let error): print(error)
      case .success(let result):
        let items = result.data
        var dataItems = [DataModelDTO.Data]()
        for view in result.view {
          if let element = items.first(where: { $0.name == view }) {
            dataItems.append(element)
          }
        }
        self?.displayItems.onNext(dataItems)
      }
    }
  }
  
}
