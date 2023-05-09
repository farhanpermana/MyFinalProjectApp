//
//  HeaderSectionTableCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 13/04/23.
//

import UIKit

enum SectionType: Int {
    case sale = 0
    case browseAllProducts = 1
}

class HeaderSectionTableCell: UITableViewCell {
    
    static let identifier = "HeaderSectionTableCell"
    
    weak var delegate: PageTransitionDelegate?
    var moreBtnFunction: (() -> Void)? // store the closure

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var moreBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func browseAllProductsSection() {
        titleLabel.text = "Browse Products"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        moreBtn.setTitle("More", for: .normal)
        moreBtn.tintColor = UIColor(rgb: 0x75001d)
    }
    
    func saleSection() {
        titleLabel.text = "Sale"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        moreBtn.setTitle("More", for: .normal)
        moreBtn.tintColor = UIColor(rgb: 0x75001d)
    }
    
    func setupCell(withSection section: SectionType, moreBtnFunction: @escaping () -> Void) {
        
        switch section {
        case .browseAllProducts:
            browseAllProductsSection()
        case .sale:
            saleSection()
            self.moreBtnFunction = moreBtnFunction
        }
    }
    
    // ibaction
    @IBAction func moreBtnTapped(_ sender: Any) {
        self.moreBtnFunction?()
        print("moreBtnTapped clicked")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
     
        // Configure the view for the selected state
    }
    
}
