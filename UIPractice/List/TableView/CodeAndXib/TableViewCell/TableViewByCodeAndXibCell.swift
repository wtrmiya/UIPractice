//
//  TableViewByCodeAndXibCell.swift
//  UIPractice
//
//  Created by Wataru Miyakoshi on 2021/12/04.
//

import UIKit

class TableViewByCodeAndXibCell: UITableViewCell {
    static let reuseIdentifier = String(describing: TableViewByCodeAndXibCell.self)
    static let nibName = String(describing: TableViewByCodeAndXibCell.self)

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(title:String, artist:String) {
        self.titleLabel.text = title
        self.artistLabel.text = artist
    }
}
