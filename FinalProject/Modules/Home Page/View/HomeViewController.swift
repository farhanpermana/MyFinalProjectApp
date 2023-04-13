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
    case newarrival = 3
    
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
        tableView.register(CatTableCell.self, forCellReuseIdentifier: CatTableCell.identifier)
        tableView.register(NewArrivalTableCell.self, forCellReuseIdentifier: NewArrivalTableCell.identifier)
        
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    lazy var searchBar: UISearchBar = UISearchBar(frame: CGRectMake(0, 0, view.bounds.width, 20))
    
    private func configureNavBar() {
        navigationController?.navigationBar.tintColor = .label
        navigationItem.title = nil
        navigationController?.navigationBar.prefersLargeTitles = false
        
        searchBar.placeholder = "Search"
        
        let leftNavBarButton = UIBarButtonItem(customView: searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton

    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // different sections using switch
        return 5
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
        case .categories:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CatTableCell.identifier, for: indexPath) as? CatTableCell else {
                return UITableViewCell()
            }
            cell.setupTable()
            return cell
        case .newarrival:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NewArrivalTableCell.identifier, for: indexPath) as? NewArrivalTableCell else {
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
            return 120
        case .categories:
            return 200
        case .newarrival:
            return 700
        default:
            return 0
        }
    }
    
    
}
