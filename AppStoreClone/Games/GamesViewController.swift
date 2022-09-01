//
//  GamesViewController.swift
//  AppStoreClone
//
//  Created by 박호현 on 2022/08/29.
//

import UIKit

class GamesViewController: UIViewController {
    var dataSource: UICollectionViewDiffableDataSource<Int, FeaturedCollectionViewCellModel>?
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewLayout = createFeaturedListLayout()
        
        dataSource = UICollectionViewDiffableDataSource<Int, FeaturedCollectionViewCellModel>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedCollectionViewCell", for: indexPath)
            (cell as? FeaturedCollectionViewCell)?.setModel(itemIdentifier)
            return cell
            
        })
        var snapShot = NSDiffableDataSourceSnapshot<Int, FeaturedCollectionViewCellModel>()
        snapShot.appendSections([0])
        snapShot.appendItems([FeaturedCollectionViewCellModel(featureReason: "사전예약", title: "원신2", subtitle: "원신을 뛰어넘다", mainImage: "https://picsum.photos/301", iconImage: "", iconName: "원신2", detail: "RPG", downloadIcon: .get, purchase: true), FeaturedCollectionViewCellModel(featureReason: "사전예약", title: "베트맨2", subtitle: "베트맨을 뛰어넘다", mainImage: "https://picsum.photos/300", iconImage: "", iconName: "베트맨2", detail: "RPG", downloadIcon: .get, purchase: true), FeaturedCollectionViewCellModel(featureReason: "사전예약", title: "간다2", subtitle: "간다을 뛰어넘다", mainImage: "https://picsum.photos/302", iconImage: "", iconName: "간다2", detail: "RPG", downloadIcon: .get, purchase: true), FeaturedCollectionViewCellModel(featureReason: "사전예약", title: "피파2", subtitle: "원신을 뛰어넘다", mainImage: "https://picsum.photos/303", iconImage: "", iconName: "피파", detail: "RPG", downloadIcon: .get, purchase: true)])
        dataSource?.apply(snapShot, animatingDifferences: true)
    }
    func createFeaturedListLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(collectionView.frame.width - 60), heightDimension: .absolute(320))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.interGroupSpacing = 10
        section.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 20)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
extension GamesViewController: UICollectionViewDelegate {
    
}
