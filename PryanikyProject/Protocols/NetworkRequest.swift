//
//  NetworkRequest.swift
//  PryanikyProject
//
//  Created by NIKOLAI BORISOV on 07.07.2021.
//

import Foundation

protocol NetworkRequest {
  var path: String { get }
  associatedtype Response = [String : Any]
  func decode(data: Data, with decoder: JSONDecoder) throws -> Response
}
