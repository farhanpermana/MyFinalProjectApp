//
//  ListsCollectionTableCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 13/04/23.
//

import UIKit

class SaleCollectionTableCell: UITableViewCell {
    
    static let identifier = "SaleCollectionTableCell"
    
    var delegate: PageTransitionDelegate?
    
    var productDatas: StoreModel?
//    var productViewModel: 
    

//    var modelCount: Int = 0
    
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
        
//        collectionView.backgroundColor = .green

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
    
//    func setupTable(modelCount: Int) {
//        self.modelCount = modelCount
    func setupTable() {
        contentView.addSubview(collectionView)
        setupCollectionView()
        collectionView.backgroundColor = UIColor.clear
        collectionView.reloadData()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    fileprivate func callAPI() {
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension SaleCollectionTableCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let countProduct = productDatas?.product.products.filter { $0.price != $0.discountPrice } ?? []
        let count = countProduct.count
        print("sale count:",count)
        return count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

//        guard let items = productDatas?[indexPath.row],
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListsCollectionCell.identifier, for: indexPath) as? ListsCollectionCell else { return UICollectionViewCell() }
//        cell.titleLabel.text = productDatas?.product.products[indexPath.row].title
//        if let productDataItem = productDatas?.product.products.randomElement() {
//            cell.setupCell()
//            cell.configure(data: productDataItem)
//        }
        let products = productDatas?.product.products.filter { $0.price != $0.discountPrice } ?? []
        cell.setupCell()
        cell.configure(data: products[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.2, height: 280)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt: indexPath=\(indexPath)")
        delegate?.moveToDetailPage()

        
    }
}
