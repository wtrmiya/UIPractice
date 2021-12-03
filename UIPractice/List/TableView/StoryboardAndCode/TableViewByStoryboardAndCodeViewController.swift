//
//  TableViewByStoryboardAndCodeViewController.swift
//  UIPractice
//
//  Created by Wataru Miyakoshi on 2021/12/04.
//

import UIKit
final class TableViewByStoryboardAndCodeViewController:UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(TableViewByStoryboardAndCodeCell.self, forCellReuseIdentifier: TableViewByStoryboardAndCodeCell.reuseIdentiifer)
        }
    }
    
    private var albums:[Album] = []
    private let navItemTitle = "TableView: Storyboard + Code"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = navItemTitle
        
        albums = DataSource.shared.albums
        
        tableView.dataSource = self
    }
}

extension TableViewByStoryboardAndCodeViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewByStoryboardAndCodeCell.reuseIdentiifer, for: indexPath) as? TableViewByStoryboardAndCodeCell
        else {
            return UITableViewCell()
        }
        
        let item = albums[indexPath.row]
        
        cell.configure(title: item.title, artist: item.artist)
        
        return cell
    }
}
