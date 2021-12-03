//
//  RootViewController.swift
//  UIPractice
//
//  Created by Wataru Miyakoshi on 2021/12/04.
//

import UIKit
final class RootViewController: UIViewController {
    private let navItemTitle = "UIPractice"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = navItemTitle
    }
}
