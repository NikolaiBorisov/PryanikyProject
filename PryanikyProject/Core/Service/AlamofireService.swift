//
//  AlamofireService.swift
//  PryanikyProject
//
//  Created by NIKOLAI BORISOV on 10.07.2021.
//

import Foundation
import Alamofire

class AlamofireService {
  
  typealias JSON = [String: Any]
  static let shared = AlamofireService()
  private init() {}
  
  func getBlocksOfInfo(completion: () -> Void) {
    AF.request(Constants.API.api).responseJSON { response in
      switch response.result {
      case let .success(value):
        print(value)
      case let .failure(error):
        print(error)
      }
    }
  }
  
}
