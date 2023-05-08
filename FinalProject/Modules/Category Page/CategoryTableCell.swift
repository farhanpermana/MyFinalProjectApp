//
//  CategoryTableCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 07/05/23.
//

import UIKit

class CategoryTableCell: UITableViewCell {
    
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
    
    func setupApi() {
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

extension CategoryTableCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productDatas?.products.count ?? 0
    
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListsCollectionCell.identifier, for: indexPath) as? ListsCollectionCell else { return UICollectionViewCell() }

        
        cell.setupCell()
        cell.configure(data: productDatas?.products[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.2, height: 280)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let product = productDatas?.products[indexPath.row]
        
        delegate?.moveToDetailPage(data: product)
        
        print(product ?? "")
    }
}
