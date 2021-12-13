//
//  AlertViewController.swift
//  UIPractice
//
//  Created by Wataru Miyakoshi on 2021/12/14.
//

import UIKit
import SwiftUI
final class AlertViewController: UIViewController {
    @IBAction func tapSwiftUIButton(_ sender: Any) {
        let vc = UIHostingController(rootView: AlertBySwiftUI())
        let nav = self.navigationController
        nav?.pushViewController(vc, animated: true)
    }
    
}
