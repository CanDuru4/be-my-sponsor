//
//  HomeViewController.swift
//  SponsorApp
//
//  Created by Can Duru on 20.09.2022.
//

import UIKit
import SideMenu

class HomeViewController: UIViewController {

    
    //MARK: Side Menu Setup
    var menu: SideMenuNavigationController?
    lazy var menuBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "sidebar.leading")?.withRenderingMode(.alwaysOriginal).withTintColor(.systemBlue), style: .done, target: self, action: #selector(menuBarButtonItemTapped))
    @objc
    func menuBarButtonItemTapped(){
         present(menu!, animated: true)
    }
    lazy var menuView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()

    //MARK: Collection View Setup
    var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "BeMySponsor"
        navigationItem.setLeftBarButton(menuBarButtonItem, animated: false)
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.leftSide = true
        
        configureCollectionView()
    }
    
    func loadContent(){
        var loadCheck = 0
        
        //Firebase load
        //isim
        //foto
        //yazı
            
        //Load
        while loadCheck == 0 {
            //Activity Indıcator and all hidden
            
            //all shown
        }
    }
    
    private func configureCollectionView(){
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "feed")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        let message = UILabel()
        message.text = "Feed content is unavailable in this checkout."
        message.textAlignment = .center
        message.numberOfLines = 0
        collectionView.backgroundView = message
        self.collectionView = collectionView
    }
    
    private func createFlowLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnv in
            return self.createFeedLayout()
        }
        return layout
    }
    
    private func createFeedLayout() -> NSCollectionLayoutSection {
        let postHeaderItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60)))
        let postCaptionItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)))
        let postImageItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1)))
        let postCommentSectionItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(55)))
        
        
        let feedGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [postHeaderItem, postCaptionItem, postImageItem, postCommentSectionItem])
        
        let feedSection = NSCollectionLayoutSection(group: feedGroup)
        
        return feedSection
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return collectionView.dequeueReusableCell(withReuseIdentifier: "feed", for: indexPath)
    }
}
