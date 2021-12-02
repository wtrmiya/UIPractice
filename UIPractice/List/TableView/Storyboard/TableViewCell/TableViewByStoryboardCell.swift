//
//  TableViewByStoryboardCell.swift
//  UIPractice
//
//  Created by Wataru Miyakoshi on 2021/12/02.
//

import UIKit

final class TableViewByStoryboardCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var artistLabel: UILabel!
    
    func configure(title:String, artist:String) {
        self.titleLabel.text = title
        self.artistLabel.text = artist
    }
}
