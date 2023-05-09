//
//  ProfileSectionTableCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 17/04/23.
//

import UIKit
import FirebaseAuth

class ProfileSectionTableCell: UITableViewCell {
    
    static let identifier = "ProfileSectionTableCell"

    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var logoutBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell() {
        bgView.layer.backgroundColor = UIColor(rgb: 0x75001d).cgColor
        profileImg.layer.cornerRadius = profileImg.frame.height / 2
        emailLbl.textColor = UIColor.white
        logoutBtn.tintColor = UIColor.white
        emailLbl.text = Auth.auth().currentUser?.email
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
