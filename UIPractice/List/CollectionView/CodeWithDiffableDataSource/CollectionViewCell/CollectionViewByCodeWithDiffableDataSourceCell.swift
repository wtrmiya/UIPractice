//
//  CollectionViewByCodeWithDiffableDataSourceCell.swift
//  UIPractice
//
//  Created by Wataru Miyakoshi on 2021/12/07.
//

import UIKit
final class CollectionViewByCodeWithDiffableDataSourceCell: UICollectionViewCell {
    static let identifier = String(describing: CollectionViewByCodeWithDiffableDataSourceCell.self)
    
    private var stackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.alignment = .fill
        return stackView
    }()
    
    private var titleLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var artistLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(artistLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    func configure(title: String, artist: String) {
        self.titleLabel.text = title
        self.artistLabel.text = artist
    }
}
