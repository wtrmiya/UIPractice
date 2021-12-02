//
//  TableViewByStoryboardViewController.swift
//  UIPractice
//
//  Created by Wataru Miyakoshi on 2021/12/02.
//

import UIKit

final class TableViewByStoryboardViewController:UIViewController {
    
    // @IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // private property
    private var albums:[Album] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.albums = DataSource.shared.albums
        
        tableView.dataSource = self
        
    }
}

// MARK: - Data Source
extension TableViewByStoryboardViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewByStoryboardCell", for: indexPath) as? TableViewByStoryboardCell
        else {
            return UITableViewCell()
        }
        
        let item = albums[indexPath.row]
        cell.configure(title: item.title, artist: item.artist)
        
        return cell
    }
}
