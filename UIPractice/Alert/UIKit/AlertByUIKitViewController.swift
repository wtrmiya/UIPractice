//
//  AlertByUIKitViewController.swift
//  UIPractice
//
//  Created by Wataru Miyakoshi on 2021/12/14.
//

import UIKit
final class AlertByUIKitViewController: UIViewController {
    
    @IBAction func onShowAlertTapped(_ sender: Any) {
        let alert = UIAlertController(title: "警告", message: "アラートを表示してみました", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true)
    }
}
