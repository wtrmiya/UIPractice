//
//  TableViewByStoryboardAndXibCell.swift
//  UIPractice
//
//  Created by Wataru Miyakoshi on 2021/12/03.
//

import UIKit

class TableViewByStoryboardAndXibCell: UITableViewCell {
    static let reuseIdentifier = String(describing: TableViewByStoryboardAndXibCell.self)
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var artistLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(title:String, artist:String) {
        self.titleLabel.text = title
        self.artistLabel.text = artist
    }
}
