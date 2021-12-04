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
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        let nav = self.navigationController
        nav?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapTableViewByCodeAndXibButton(_ sender: Any) {
        let vc = TableViewByCodeAndXibViewController()
        let nav = self.navigationController
        nav?.pushViewController(vc, animated: true)
    }
}
