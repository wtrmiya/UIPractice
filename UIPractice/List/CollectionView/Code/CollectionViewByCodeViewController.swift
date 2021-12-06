//
//  CollectionViewByCodeViewController.swift
//  UIPractice
//
//  Created by Wataru Miyakoshi on 2021/12/06.
//

import UIKit
final class CollectionViewByCodeViewController:UIViewController {
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: CollectionViewByCodeViewController.createLayout())

    private var albums:[Album] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.albums = DataSource.shared.albums
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CollectionViewByCodeCell.self, forCellWithReuseIdentifier:CollectionViewByCodeCell.identifier)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        collectionView.dataSource = self
    }

    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        
        // return layout
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}

// MARK: - UICollectionView Data Source
extension CollectionViewByCodeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewByCodeCell.identifier, for: indexPath) as? CollectionViewByCodeCell
        else {
            return UICollectionViewCell()
        }
        
        let item = albums[indexPath.item]
        cell.configure(title: item.title, artist: item.artist)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }
}
