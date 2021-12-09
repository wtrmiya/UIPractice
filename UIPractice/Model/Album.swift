//
//  Album.swift
//  UIPractice
//
//  Created by Wataru Miyakoshi on 2021/12/02.
//

import Foundation

struct Album: Decodable, Hashable, Identifiable {
    
    let title:String
    let artist:String
    var id = UUID().uuidString
    
    enum CodingKeys: String, CodingKey {
        case title
        case artist
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs:Album, rhs:Album) -> Bool {
        return lhs.id == rhs.id
    }
}
