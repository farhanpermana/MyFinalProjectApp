//
//  ProfileController.swift
//  FinalProject
//
//  Created by Farhan Permana on 17/04/23.
//

import UIKit

enum PageSections: Int {
    case profile = 0
    case menus = 1
}

class ProfileController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    func setupTable() {
        tableView.register(UINib(nibName: "ProfileSectionTableCell", bundle: nil), forCellReuseIdentifier: ProfileSectionTableCell.identifier)
        tableView.register(UINib(nibName: "MenuTableCell", bundle: nil), forCellReuseIdentifier: MenuTableCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension ProfileController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1 // profile section
        case 1:
            return 4 // menus section
        default:
            return 0
        
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = PageSections(rawValue: indexPath.section)
        switch sections {
        case .profile:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileSectionTableCell.identifier, for: indexPath) as? ProfileSectionTableCell else { return UITableViewCell() }
            return cell
        case .menus:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableCell.identifier, for: indexPath) as? MenuTableCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = PageSections(rawValue: indexPath.section)
        switch section {
        case .profile:
            return 150
        case .menus:
            // auto size
            return 50
        default:
            return 0
        }
        
        
    }
}
