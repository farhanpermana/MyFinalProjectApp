//
//  HeaderSectionTableCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 13/04/23.
//

import UIKit



enum SectionType: Int {
    case categories = 0
    case newArrival = 1
    case sale = 2
    case popular = 3
}

class HeaderSectionTableCell: UITableViewCell {
    
    static let identifier = "HeaderSectionTableCell"
    
    var delegate: PageTransitionDelegate?
    var moreBtnFunction: (() -> Void)? // store the closure

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var moreBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
    func categoriesSection() {
        titleLabel.text = "Categories"
        moreBtn.setTitle("More", for: .normal)
    }
    
    func newArrivalSection() {
        titleLabel.text = "New Arrival"
        moreBtn.setTitle("More", for: .normal)
    }
    
    func saleSection() {
        titleLabel.text = "Sale"
        moreBtn.setTitle("More", for: .normal)
    }
    
    func popularSection() {
        titleLabel.text = "Popular"
        moreBtn.setTitle("More", for: .normal)
    }
    
    func setupCell(withSection section: SectionType, moreBtnFunction: @escaping () -> Void) {
        
        switch section {
        case .categories:
            categoriesSection()
        case .newArrival:
            newArrivalSection()
        case .sale:
            saleSection()
        case .popular:
            popularSection()
        }
        self.moreBtnFunction = moreBtnFunction
    }
    
    // ibaction
    @IBAction func moreBtnTapped(_ sender: Any) {
//        self.delegate?.moveToMorePage(withTitle: titleLabel.text ?? "")
        self.moreBtnFunction?()
        print("clicked")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
     
        // Configure the view for the selected state
    }
    
}