//
//  NewArrivalTableCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 11/04/23.
//

import UIKit

class BrowseProductsTableCell: UITableViewCell {
    
    static let identifier = "BrowseProductsTableCell"
    
    weak var delegate: PageTransitionDelegate?
    
    var productViewModel: ProductsViewModel?
    var browseProductsDatas: ProductsModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UINib(nibName: "ListsCollectionCell", bundle: nil), forCellWithReuseIdentifier: ListsCollectionCell.identifier)
        collectionView.layer.masksToBounds = true
        
        return collectionView
    }()
    
    func setupCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func setupTable() {
        contentView.addSubview(collectionView)
        setupCollectionView()
        collectionView.backgroundColor = UIColor.lightGray
        
        collectionView.delegate = self
        collectionView.dataSource = self
        setupApi()
    }
    
    fileprivate func setupApi() {
        self.productViewModel = ProductsViewModel(apiService: ApiService())
        self.productViewModel?.bindProductsData = {
            listModel in
            if let listData = listModel {
                self.browseProductsDatas = listData
                print("bound products")
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension BrowseProductsTableCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = browseProductsDatas?.products.count ?? 0
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let browse = browseProductsDatas?.products[indexPath.row],
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListsCollectionCell.identifier, for: indexPath) as? ListsCollectionCell else {
            return UICollectionViewCell()
        }
        
        cell.configureBrowse(data: browse)
        cell.setupCell()
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 6, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // auto resizing height
        return CGSize(width: collectionView.frame.width / 2.3, height: 330 )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = browseProductsDatas?.products[indexPath.row]
        
        delegate?.moveToDetailPage(data: product)
        
        print(product ?? "no browse")
    }
    
    
}
