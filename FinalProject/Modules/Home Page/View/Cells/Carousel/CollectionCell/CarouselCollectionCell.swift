//
//  CarouselCollectionCell.swift
//  FinalProject
//
//  Created by Farhan on 10/04/23.
//

import UIKit
import SDWebImage

class CarouselCollectionCell: UICollectionViewCell {
    

    @IBOutlet weak var imgView: UIImageView!
    
    static let identifier = "CarouselCollectionCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell() {
        imgView.layer.cornerRadius = 4
        self.layer.borderWidth = 0.0
        self.layer.masksToBounds = true
    }
    
    func configureCarouselCell(data: CarouselElement?) {
        imgView.imageFromURL(urlString: data?.banner ?? "", size: CGSize(width: 100, height: 50))
    }
    
    

}
