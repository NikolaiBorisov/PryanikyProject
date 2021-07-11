//
//  GetDataRequest.swift
//  PryanikyProject
//
//  Created by NIKOLAI BORISOV on 07.07.2021.
//

import Foundation

struct GetDataRequest: NetworkRequest {
  
  typealias Response = DataModelDTO
  var path: String = ""
  
}
