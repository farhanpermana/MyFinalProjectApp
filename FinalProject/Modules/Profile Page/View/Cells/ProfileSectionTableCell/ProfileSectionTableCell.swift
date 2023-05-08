//
//  ProfileSectionTableCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 17/04/23.
//

import UIKit

class ProfileSectionTableCell: UITableViewCell {
    
    static let identifier = "ProfileSectionTableCell"

    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var logoutBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

    }
    
    func setupCell() {
        bgView.layer.backgroundColor = UIColor(rgb: 0x7d9abb).cgColor
        profileImg.layer.cornerRadius = profileImg.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
