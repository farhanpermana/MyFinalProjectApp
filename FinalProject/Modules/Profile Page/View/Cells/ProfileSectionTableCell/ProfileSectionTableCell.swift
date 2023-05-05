//
//  ProfileSectionTableCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 17/04/23.
//

import UIKit

class ProfileSectionTableCell: UITableViewCell {
    
    static let identifier = "ProfileSectionTableCell"

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       setupCell()
    }
    
    func setupCell() {
        profileImg.layer.cornerRadius = profileImg.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
