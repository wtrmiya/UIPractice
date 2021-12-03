//
//  TableViewByStoryboardAndXibViewController.swift
//  UIPractice
//
//  Created by Wataru Miyakoshi on 2021/12/03.
//

import UIKit

final class TableViewByStoryboardAndXibViewController:UIViewController {
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            let cellNib = UINib(nibName: TableViewByStoryboardAndXibCell.reuseIdentifier, bundle: nil)
            tableView.register(cellNib, forCellReuseIdentifier: TableViewByStoryboardAndXibCell.reuseIdentifier)
        }
    }
    
    private var albums:[Album] = []
    private let navItemTitle = "TableView: Storyboard + Xib"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = navItemTitle
        
        albums = DataSource.shared.albums
        
        tableView.dataSource = self
    }
}

extension TableViewByStoryboardAndXibViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewByStoryboardAndXibCell.reuseIdentifier, for: indexPath) as? TableViewByStoryboardAndXibCell
        else {
            return UITableViewCell()
        }
        
        let item = albums[indexPath.row]
        cell.configure(title: item.title, artist: item.artist)
        
        return cell
    }
}
