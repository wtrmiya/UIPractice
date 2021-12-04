//
//  TableViewWithCodeCell.swift
//  UIPractice
//
//  Created by Wataru Miyakoshi on 2021/12/04.
//

import UIKit
final class TableViewByCodeCell:UITableViewCell {
    static let reuseIdentifier = String(describing: TableViewByCodeCell.self)
    
    private let verticalStackView:UIStackView! = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    // private property
    private var titleLabel:UILabel! = {
        let label = UILabel()
        return label
    }()
    
    private var artistLabel:UILabel! = {
        let label = UILabel()
        return label
    }()
    
    
    // initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    
    // function
    func configure(title:String, artist:String) {
        self.titleLabel.text = title
        self.artistLabel.text = artist
    }
    
    
    private func setupCell() {
        // stackview
        contentView.addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
        
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(artistLabel)
    }
    
}
