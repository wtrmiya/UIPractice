//
//  TableviewWithCode.swift
//  UIPractice
//
//  Created by Wataru Miyakoshi on 2021/12/04.
//

import UIKit
final class TableViewByCodeViewController:UIViewController {
    private let navItemTitle = "TableView: Code"
    
    private let tableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableViewByCodeCell.self, forCellReuseIdentifier: TableViewByCodeCell.reuseIdentifier)
        return tableView
    }()
    
    private var albums:[Album] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = navItemTitle
        
        albums = DataSource.shared.albums
        
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        tableView.dataSource = self
    }
}

extension TableViewByCodeViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewByCodeCell.reuseIdentifier, for: indexPath) as? TableViewByCodeCell
        else {
            return UITableViewCell()
        }
        
        let item = albums[indexPath.row]
        cell.configure(title: item.title, artist: item.artist)
        
        return cell
    }
}
