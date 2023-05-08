//
//  ImageTableCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 02/05/23.
//

import UIKit

class ProductImgTableCell: UITableViewCell {
    
    static let identifier = "ProductImgTableCell"
    
    var productDetailImgDatas: ProductsModel?
    var productDetailImgDatasArray: Product?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        collectionView.register(UINib(nibName: "ProductDetailImgCollectionCell", bundle: nil), forCellWithReuseIdentifier: ProductDetailImgCollectionCell.identifier)
        collectionView.layer.masksToBounds = false
        
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
        collectionView.backgroundColor = UIColor.clear
        collectionView.reloadData()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ProductImgTableCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = productDetailImgDatas?.products[section].images.count ?? 0
        
        print("detail img", count)
        return count
    }
    
    // MARK: - Collection View Cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductDetailImgCollectionCell.identifier, for: indexPath) as? ProductDetailImgCollectionCell else { return UICollectionViewCell() }
        cell.setupProductDetailImgCollectionCell()

        cell.productDetailImg.sd_setImage(with: URL(string: productDetailImgDatas?.products.first?.images[indexPath.row] ?? ""), completed: nil)
        return cell
    }
    
    // MARK: - Collection View Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = self.bounds.width
        return CGSize(width: screenSize, height: 300)
    }
    
    
}
