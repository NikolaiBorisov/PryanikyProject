//
//  NetworkManager.swift
//  PryanikyProject
//
//  Created by NIKOLAI BORISOV on 07.07.2021.
//

import UIKit

enum NetworkError: String, Error {
  case somethingWrongWithUrlRequest
  case somethingWrongWithUrlSessionData
}

class NetworkManager {
  
  static let shared = NetworkManager()
  
  private lazy var decoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
  }()
  
  private lazy var session: URLSession = {
    let configuration = URLSessionConfiguration.default
    return URLSession(configuration: configuration)
  }()
  
  func request<T: NetworkRequest>(request: T, closure: @escaping (Result<T.Response, Error>) -> Void) {
    guard let urlRequest = request.tryToBuildUrlRequest() else {
      closure(.failure(NetworkError.somethingWrongWithUrlRequest))
      return
    }
    self.session
      .dataTask(with: urlRequest, completionHandler: { data, _, error in
        if let error = error {
          closure(.failure(error))
          return
        }
        guard let data = data else {
          closure(.failure(NetworkError.somethingWrongWithUrlSessionData))
          return
        }
        do {
          let response = try request.decode(data: data, with: self.decoder)
          DispatchQueue.main.async {
            closure(.success(response))
          }
        } catch {
          closure(.failure(error))
        }
      })
      .resume()
  }
  
}

