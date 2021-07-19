//
//  DataModelDTO.swift
//  PryanikyProject
//
//  Created by NIKOLAI BORISOV on 07.07.2021.
//

import Foundation

struct DataModelDTO: Decodable {
  
  enum ObjectType: String, Decodable {
    case hz
    case picture
    case selector
    case none
    
    init(from decoder: Decoder) throws {
      let container = try decoder.singleValueContainer()
      let value = try container.decode(String.self)
      self = ObjectType.init(rawValue: value) ?? .none
    }
  }
  
  var data: [Data]
  var view: [ObjectType]
  
  struct Data: Decodable {
    var name: ObjectType
    var data: Object
    
    enum Object: Decodable {
      case picture(Picture)
      case selector(Selector)
      case text(Text)
      case none
      
      init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let picture = try? container.decode(Picture.self) {
          self = .picture(picture)
        } else if let selector = try? container.decode(Selector.self) {
          self = .selector(selector)
        } else if let text = try? container.decode(Text.self) {
          self = .text(text)
        } else {
          self = .none
        }
      }
    }
    
    struct Text: Decodable {
      let text: String
    }
    
    struct Picture: Decodable {
      let url: URL
      let text: String
    }
    
    struct Selector: Decodable {
      let selectedId: Int
      let variants: [Variant]
      
      struct Variant: Decodable {
        let id: Int
        let text: String
      }
    }
  }
  
}
