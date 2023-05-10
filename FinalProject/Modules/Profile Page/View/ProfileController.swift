//
//  ProfileController.swift
//  FinalProject
//
//  Created by Farhan Permana on 17/04/23.
//

import UIKit
import FirebaseAuth

enum PageSections: Int {
    case profile = 0
    case menus = 1
}

class ProfileController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let menus = ["My Orders", "My Address", "My Wishlist", "My Reviews"]
    
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
    
    @objc func logoutBtnTapped(_ sender: Any) {
        // firebase logout and show dialog
        let firebaseAuth = Auth.auth()
        let alert = UIAlertController(title: "Logout", message: "Are you sure want to logout?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
            do {
                try firebaseAuth.signOut()
                // hide tabbar
                self.tabBarController?.tabBar.isHidden = true
                // move to sign in
                self.showSignInController()
            } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError)
            }
            
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}

extension ProfileController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1 // profile section
        case 1:
            return menus.count // menus section
        default:
            return 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = PageSections(rawValue: indexPath.section)
        switch sections {
            
        case .profile:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileSectionTableCell.identifier, for: indexPath) as? ProfileSectionTableCell else { return UITableViewCell() }
            // action logoutbtntapped
            cell.logoutBtn.addTarget(self, action: #selector(self.logoutBtnTapped(_:)), for: .touchUpInside)
            cell.setupCell()
            return cell
            
        case .menus:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableCell.identifier, for: indexPath) as? MenuTableCell else { return UITableViewCell() }
            cell.titleLabel.text = menus[indexPath.row]
            cell.setupCell()
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
            return 100
        case .menus:
            // auto size
            return UITableView.automaticDimension
        default:
            return 0
        }
        
        
    }
}

extension UIViewController {
    func showHomeController() {
        let vc = HomeViewController()
        
        // set tabbar as root view controller
        let tabbar = TabBar()
        self.view.window?.rootViewController = tabbar
        
        self.navigationController?.pushViewController(vc, animated: true)
        // Remove the current view controller from its parent view controller
        removeFromParent()
    }
}
