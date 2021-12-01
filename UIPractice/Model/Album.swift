//
//  Album.swift
//  UIPractice
//
//  Created by Wataru Miyakoshi on 2021/12/02.
//

import Foundation

struct Album: Codable {
    let title:String
    let artist:String
    
    enum CodingKeys: String, CodingKey {
        case title
        case artist
    }
}
