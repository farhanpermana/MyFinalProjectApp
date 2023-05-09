//
//  CatTableCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 11/04/23.
//

import UIKit

class CatTableCell: UITableViewCell {
    
    static let identifier = "CatTableCell"
    
    var catDatas: StoreModel?
    var catProduct: ProductsModel?
    
    var selectedCategory: String?
    
    weak var delegate: PageTransitionDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UINib(nibName: "CatCollectionCell", bundle: nil), forCellWithReuseIdentifier: CatCollectionCell.identifier)
        collectionView.layer.masksToBounds = false
        collectionView.layer.cornerRadius = 40
        
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    func setupLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 1, left: 12, bottom: 1, right: 12)
        layout.minimumInteritemSpacing = 0
        let screenSize = self.frame.width - layout.sectionInset.left -
        layout.sectionInset.right - layout.minimumInteritemSpacing
        layout.itemSize = CGSize(width: screenSize / 5, height: 70)
        
        return layout
    }
    
    func setupCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func setupTable() {
        collectionView.collectionViewLayout = setupLayout()
        contentView.addSubview(collectionView)
        setupCollectionView()
        collectionView.backgroundColor = UIColor.clear
        collectionView.reloadData()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension CatTableCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let category = catDatas?.category.categories[indexPath.row],
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatCollectionCell.identifier, for: indexPath) as? CatCollectionCell else {
            return UICollectionViewCell()
        }
        
        cell.configureCell(data: category)
        cell.setupCell()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let categories = catDatas?.category.categories
        print("cat count", categories?.count ?? 0)
        return categories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("category clicked")
        
        guard let selectedCategory = catDatas?.category.categories[indexPath.row].name else {
            return
        }
        delegate?.moveToCategoryPage(selectedCategory: selectedCategory)
        
    }
}
