//
//  SwiftUIListContentView.swift
//  UIPractice
//
//  Created by Wataru Miyakoshi on 2021/12/08.
//

import SwiftUI

struct SwiftUIListContentView: View {
    @State var albums: [Album] = DataSource.shared.albums
    
    var body: some View {
        List {
            ForEach(albums) { album in
                VStack {
                    HStack {
                        Text(album.title)
                        Spacer()
                    }
                    HStack {
                        Text(album.artist)
                        Spacer()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIListContentView()
    }
}
