//
//  ListsCollectionTableCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 13/04/23.
//

import UIKit

class SaleCollectionTableCell: UITableViewCell {
    
    static let identifier = "SaleCollectionTableCell"
    
    weak var delegate: PageTransitionDelegate?
    
    var productViewModel: ProductsViewModel?
    var productDatas: ProductsModel?
    
    
    // scrolldirection
    var scrollDirection: UICollectionView.ScrollDirection = .horizontal {
        didSet {
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = scrollDirection
            }
        
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
//        layout.scrollDirection = .horizontal
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
        collectionView.reloadData()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setupApi()
    }
    
    fileprivate func setupApi() {
        self.productViewModel = ProductsViewModel(apiService: ApiService())
        self.productViewModel?.bindProductsData = {
            listModel in
            if let listData = listModel {
                self.productDatas = listData
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

extension SaleCollectionTableCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let countProduct = productDatas?.products.filter { $0.price != $0.discountPrice }
        let count = countProduct?.count ?? 0
        print("sale count:", count)
        return count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListsCollectionCell.identifier, for: indexPath) as? ListsCollectionCell else { return UICollectionViewCell() }
        if let productDataItem = productDatas?.products.filter({ $0.price != $0.discountPrice })[indexPath.row] {
            
            cell.configure(data: productDataItem)
            cell.setupCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.2, height: 330)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let filteredProducts = productDatas?.products.filter { $0.price != $0.discountPrice }
        let product = filteredProducts?[indexPath.row]
        
        delegate?.moveToDetailPage(data: product)
        
        print(product ?? "no product")
    }
}
