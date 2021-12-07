//
//  Album.swift
//  UIPractice
//
//  Created by Wataru Miyakoshi on 2021/12/02.
//

import Foundation

struct Album: Decodable, Hashable {
    let title:String
    let artist:String
    var identifier = UUID().uuidString
    
    enum CodingKeys: String, CodingKey {
        case title
        case artist
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func ==(lhs:Album, rhs:Album) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
