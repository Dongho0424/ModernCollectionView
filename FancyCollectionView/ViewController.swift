//
//  ViewController.swift
//  FancyCollectionView
//
//  Created by 최동호 on 2021/07/02.
//

import UIKit

class ViewController: UIViewController {
    let sections = Bundle.main.decode([Section].self, from: "appstore.json")
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, App>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: self.createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        collectionView.register(FeaturedCell.self, forCellWithReuseIdentifier: FeaturedCell.identifier)
        
        createDataSource()
        reloadData()
    }
    
    func configure<T: SelfConfiguringCell>(_ cellType: T.Type, with app: App, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.identifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue \(cellType)")
        }
        
        cell.configure(with: app)
        return cell
    }
    
    func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, App>(collectionView: collectionView) {
            collectionView, indexPath, app in
            
            switch self.sections[indexPath.section].type {
            default:
                return self.configure(FeaturedCell.self, with: app, for: indexPath)
            }
        }
    }
    
    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, App>()
        snapshot.appendSections(sections)
        
        for section in sections {
            snapshot.appendItems(section.items, toSection: section)
        }
        
        dataSource.apply(snapshot)
    }
    
    func createFeaturedSection(using section: Section) -> NSCollectionLayoutSection {
        // 1 이면 그룹의 사이즈와 동일
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
//        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(350))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
        layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
        
        return layoutSection
    }
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            sectionIndex, layoutEnvironment in
            
            let section = self.sections[sectionIndex]
            
            switch section.type {
            default:
                return self.createFeaturedSection(using: section)
            }
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        
        return layout
    }

}

