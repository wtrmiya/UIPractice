//
//  ListViewController.swift
//  UIPractice
//
//  Created by Wataru Miyakoshi on 2021/12/04.
//

import UIKit

final class ListViewController:UIViewController {
    
    @IBAction func tapTableViewByCodeButton(_ sender: Any) {
        let vc = TableViewByCodeViewController()
        let nav = self.navigationController
        nav?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapTableViewByCodeAndXibButton(_ sender: Any) {
        let vc = TableViewByCodeAndXibViewController()
        let nav = self.navigationController
        nav?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapCollectionViewByCodeButton(_ sender: Any) {
        let vc = CollectionViewByCodeViewController()
        let nav = self.navigationController
        nav?.pushViewController(vc, animated: true)
    }
    @IBAction func tapCollectionViewByCodeWithDiffableDataSourceButton(_ sender: Any) {
        let vc = CollectionViewByCodeWithDiffableDataSourceViewController()
        let nav = self.navigationController
        nav?.pushViewController(vc, animated: true)
    }
    @IBAction func tapCollectionViewListButton(_ sender: Any) {
        let vc = CollectionViewListViewController()
        let nav = self.navigationController
        nav?.pushViewController(vc, animated: true)
    }
}
