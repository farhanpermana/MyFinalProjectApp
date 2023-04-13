//
//  CatCollectionCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 11/04/23.
//

import UIKit

class CatCollectionCell: UICollectionViewCell {
    
    static let identifier = "CatCollectionCell"
    
    
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var catImg: UIImageView!
    
    @IBOutlet weak var catTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    func setupCell() {
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
    
        
    }

}
