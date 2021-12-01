//
//  Decoder.swift
//  UIPractice
//
//  Created by Wataru Miyakoshi on 2021/12/02.
//

import Foundation

final class DataSource {
    static let shared = DataSource()
    
    var albums:[Album]
    
    private let decoder = JSONDecoder()
    
    private init() {
        guard let url = Bundle.main.url(forResource: "DummyData", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let albums = try? decoder.decode([Album].self, from: data)
        else {
            self.albums = []
            return
        }
        
        self.albums = albums
    }
}
