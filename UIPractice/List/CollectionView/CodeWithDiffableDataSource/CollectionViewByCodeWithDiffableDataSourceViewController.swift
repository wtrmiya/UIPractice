//
//  CollectionViewByCodeWithDiffableDataSourceViewController.swift
//  UIPractice
//
//  Created by Wataru Miyakoshi on 2021/12/07.
//

import UIKit
final class CollectionViewByCodeWithDiffableDataSourceViewController: UIViewController {
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: CollectionViewByCodeWithDiffableDataSourceViewController.createLayout())
    
    private var datasource:UICollectionViewDiffableDataSource<Section, Album>!

    private var albums:[Album] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.albums = DataSource.shared.albums
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CollectionViewByCodeWithDiffableDataSourceCell.self, forCellWithReuseIdentifier:CollectionViewByCodeWithDiffableDataSourceCell.identifier)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        configureDataSource()
        
        configureSnapshot()
    }
    
    private func configureDataSource() {
        datasource = UICollectionViewDiffableDataSource<Section, Album>(collectionView: collectionView) {
            (collectionView, indexPath, album) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewByCodeWithDiffableDataSourceCell.identifier, for: indexPath) as? CollectionViewByCodeWithDiffableDataSourceCell
            else {
                fatalError("Cannot create cell")
            }
            
            cell.configure(title: album.title, artist: album.artist)
            
            return cell
        }
    }
    
    private func configureSnapshot() {
        var currentSnapshot = NSDiffableDataSourceSnapshot<Section, Album>()
        
        currentSnapshot.appendSections([Section.main])
        currentSnapshot.appendItems(albums)
        
        datasource.apply(currentSnapshot, animatingDifferences: false)
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
