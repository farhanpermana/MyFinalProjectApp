//
//  HomeViewController.swift
//  FinalProject
//
//  Created by Farhan on 06/04/23.
//

import UIKit

enum HomeSection: Int {
    case carousel = 0
    case categories = 1
    case popular = 2
    
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        configureNavBar()
    }
    
    private func registerTableView() {
        tableView.register(CarouselTableCell.self, forCellReuseIdentifier: CarouselTableCell.identifier)
        
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureNavBar() {
        navigationController?.navigationBar.tintColor = .label
        navigationItem.title = nil
        navigationController?.navigationBar.prefersLargeTitles = false
        
        // navbar items
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                image: UIImage(systemName: "line.horizontal.3"),
                style: .plain,
                target: self,
                action: nil
            ),
            UIBarButtonItem(
                image: UIImage(systemName: "magnifyingglass"),
                style: .plain,
                target: self,
                action: nil
            )
        ]
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = HomeSection(rawValue: indexPath.section)
        switch section {
        case .carousel:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CarouselTableCell.identifier, for: indexPath) as? CarouselTableCell else {
                return UITableViewCell()
            }
            cell.setupTable()
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = HomeSection(rawValue: indexPath.section)
        switch section {
        case .carousel:
            return 150
        default:
            return 0
        }
    }
    
    
}
