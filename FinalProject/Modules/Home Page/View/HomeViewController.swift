//
//  HomeViewController.swift
//  FinalProject
//
//  Created by Farhan Permana on 27/04/23.
//

import UIKit

enum HomeSection: Int {
    case carousel = 0
    case categoriesTitle = 1
    case categories = 2
    case saleTitle = 3
    case sale = 4
    case newArrivalTitle = 5
    case newArrival = 6
    case popularTitle = 7
    case popular = 8
    
}

protocol PageTransitionDelegate {
    func moveToMorePage(withTitle title: String)
    func moveToDetailPage()
    func moveToCategoryPage(data: StoreModel?)
}

class HomeViewController: UIViewController {
    
    var homeViewModel: HomeViewModel?
    
    private var storeDatas: StoreModel?
    private var productDatas: Product?
    
    var delegate: PageTransitionDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        configureNavBar()
        setupApi()
        delegate = self
    }
    
    private func registerTableView() {
        tableView.register(CarouselTableCell.self, forCellReuseIdentifier: CarouselTableCell.identifier)
        tableView.register(CatTableCell.self, forCellReuseIdentifier: CatTableCell.identifier)
        // sale
        tableView.register(SaleCollectionTableCell.self, forCellReuseIdentifier: SaleCollectionTableCell.identifier)
        // new arrival
        tableView.register(NewArrivalTableCell.self, forCellReuseIdentifier: NewArrivalTableCell.identifier)
        tableView.register(UINib(nibName: HeaderSectionTableCell.identifier, bundle: nil), forCellReuseIdentifier: HeaderSectionTableCell.identifier)
        tableView.register(UINib(nibName: ListsTableCell.identifier, bundle: nil), forCellReuseIdentifier: ListsTableCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
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
    
    private func setupApi(apiUrl: String = "http://localhost:3003/store") {
        self.homeViewModel = HomeViewModel(urlString: apiUrl, apiService: ApiService())
        self.homeViewModel?.bindListData = {
            listModel in
            if let listData = listModel {
                self.storeDatas = listData
                print("bound", self.storeDatas?.title ?? "failed bind")
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func moveToCategoriesPage() {
        // Handle Categories section More button action
        let vc = MoreCategoriesController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func moveToSalePage() {
        // Handle Sale section More button action
        let vc = MoreSaleController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func moveToNewArrivalPage() {
        // Handle New Arrival section More button action
        let vc = MoreSaleController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func moveToPopularPage() {
        // Handle Popular section More button action
        let vc = MoreSaleController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return 1
        case 4:
            return 1
        case 5:
            return 1
        case 6:
            return 1
        case 7:
            return 1
        case 8:
            return 2
            
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // different sections using switch
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = HomeSection(rawValue: indexPath.section)
        switch section {
        case .carousel:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CarouselTableCell.identifier, for: indexPath) as? CarouselTableCell else {
                return UITableViewCell()
            }
            cell.carouselDatas = storeDatas
            
            cell.setupTable()
            return cell
        // MARK: - header sections start
        case .categoriesTitle:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderSectionTableCell.identifier, for: indexPath) as? HeaderSectionTableCell else {
                return UITableViewCell()
            }
            cell.setupCell(withSection: .categories) {
                self.delegate?.moveToMorePage(withTitle: "Categories")
            }
            cell.delegate = self.delegate
            return cell
            
        case .saleTitle:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderSectionTableCell.identifier, for: indexPath) as? HeaderSectionTableCell else {
                return UITableViewCell()
            }
            cell.setupCell(withSection: .sale) {
                self.delegate?.moveToMorePage(withTitle: "Sale")
            }
            cell.delegate = self.delegate
            return cell
        case .newArrivalTitle:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderSectionTableCell.identifier, for: indexPath) as? HeaderSectionTableCell else {
                return UITableViewCell()
            }
            cell.setupCell(withSection: .newArrival) {
                
            }
            cell.delegate = self.delegate
            return cell
        case .popularTitle:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderSectionTableCell.identifier, for: indexPath) as? HeaderSectionTableCell else {
                return UITableViewCell()
            }
            cell.setupCell(withSection: .popular) {
                
            }
            cell.delegate = self.delegate
            return cell
        // MARK: - header sections end
        case .categories:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CatTableCell.identifier, for: indexPath) as? CatTableCell else {
                return UITableViewCell()
            }
            cell.setupTable()
            cell.delegate = self
            cell.catDatas = storeDatas
            return cell
            
        case .sale:
//            guard let items = brandDatas?.products[indexPath.row],
              guard let cell = tableView.dequeueReusableCell(withIdentifier: SaleCollectionTableCell.identifier, for: indexPath) as? SaleCollectionTableCell else { return UITableViewCell()}
            
            cell.delegate = self
            cell.productDatas = storeDatas
            cell.setupTable()
            // if priceLabel have same value as discountprice dont show
            
            

            cell.scrollDirection = .horizontal
            
            return cell
            
        case .newArrival:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NewArrivalTableCell.identifier, for: indexPath) as? NewArrivalTableCell else {
                return UITableViewCell()
            }
            cell.setupTable()
            return cell
            
        case .popular:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ListsTableCell.identifier, for: indexPath) as? ListsTableCell else {
                return UITableViewCell()
            }
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
        case .categoriesTitle:
            // auto size
            return UITableView.automaticDimension
            
        case .categories:
            return 200
        case .saleTitle:
            return UITableView.automaticDimension
        case .sale:
            return 280
        case .newArrivalTitle:
            return UITableView.automaticDimension
            
        case .newArrival:
            return 280
        case .popularTitle:
            return UITableView.automaticDimension
        case .popular:
            return 90
            
        default:
            return 0
        }
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.section == 4 {
//            self.moveToDetailPage()
//        }
//
//    }
    
}

extension HomeViewController: PageTransitionDelegate {
    func moveToCategoryPage(data: StoreModel?) {
        let vc = CategoryController()
        vc.storeDatas = data
        self.navigationController?.pushViewController(vc, animated: true)
    
    }
    
    
    func moveToDetailPage() {
        let vc = DetailItemController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func moveToMorePage(withTitle title: String) {
        switch title {
        case "Categories":
            moveToCategoriesPage()
        case "Sale":
            moveToSalePage()
        case "New Arrival":
            moveToNewArrivalPage()
        case "Popular":
            moveToPopularPage()
        default:
            break
        }
    
    }

    
    
}
