//
//  CollectionViewList.swift
//  UIPractice
//
//  Created by Wataru Miyakoshi on 2021/12/08.
//

import UIKit
final class CollectionViewListViewController: UIViewController {
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: CollectionViewListViewController.createLayout())
    
    private var datasource:UICollectionViewDiffableDataSource<Section, Album>!

    private var albums:[Album] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.albums = DataSource.shared.albums
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CollectionViewListCell.self, forCellWithReuseIdentifier:CollectionViewListCell.identifier)
        
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
        
        // MARK: CellRegistrationインスタンスの作成は、クロージャの外側で実行する必要がある。
        let cellRegistration = UICollectionView.CellRegistration<CollectionViewListCell, Album> {
            cell, _, album in
            cell.configure(title: album.title, artist: album.artist)
        }
        
        datasource = UICollectionViewDiffableDataSource<Section, Album>(collectionView: collectionView) {
            (collectionView, indexPath, album) -> UICollectionViewCell? in
            
            // MARK: ここでCellRegistrationを作成しても、実行時にエラーになる。
//            let cellRegistration = UICollectionView.CellRegistration<CollectionViewListCell, Album> {
//                cell, _, album in
//                cell.configure(title: album.title, artist: album.artist)
//            }
            
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: album)
        }
    }
    
    private func configureSnapshot() {
        var currentSnapshot = NSDiffableDataSourceSnapshot<Section, Album>()
        
        currentSnapshot.appendSections([Section.main])
        currentSnapshot.appendItems(albums)
        
        datasource.apply(currentSnapshot, animatingDifferences: false)
    }

    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        let configuration = UICollectionLayoutListConfiguration(appearance: .grouped)
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }
}
