//
//  Networking.swift
//  Networking
//
//  Created by lera on 17.06.2022.
//
import Foundation

public struct Cat: Codable{
    public let url : URL?
    public let id : String?
}

public class Networking{
    let limit = 10
    var after = ""
   public var Cats: [Cat] = []
   public func gaveImage() -> [Cat] {
       let dataNew = try! Data(contentsOf: URL(string: "https://api.thecatapi.com/v1/images/search?limit=\(self.limit)&raw_json=1&after=\(after)")!)
      let  Cats = try! JSONDecoder().decode([Cat].self, from:dataNew)
      return Cats
    }
    public init() {}
}

