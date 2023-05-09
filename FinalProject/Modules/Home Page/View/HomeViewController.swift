//
//  HomeViewController.swift
//  FinalProject
//
//  Created by Farhan Permana on 27/04/23.
//

import UIKit
import SkeletonView

enum HomeSection: Int {
    case carousel = 0
    case categories = 1
    case saleTitle = 2
    case sale = 3
    case browseAllProductsTitle = 4
    case browseAllProducts = 5
}

protocol PageTransitionDelegate: AnyObject {
    func moveToMorePage(withTitle title: String)
    func moveToDetailPage(data: Product?)
    func moveToCategoryPage(selectedCategory: String?)
    func moveToOrderProductPage()
}

class HomeViewController: UIViewController {
    
    var homeViewModel: HomeViewModel?
    
    private var storeDatas: StoreModel?
    private var catDatas: ProductCategory?
    private var productDatas: ProductsModel?
    
    weak var delegate: PageTransitionDelegate?
    
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
        tableView.register(BrowseProductsTableCell.self, forCellReuseIdentifier: BrowseProductsTableCell.identifier)
        tableView.register(UINib(nibName: HeaderSectionTableCell.identifier, bundle: nil), forCellReuseIdentifier: HeaderSectionTableCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
    }
    
    lazy var searchBar: UISearchBar = UISearchBar(frame: CGRectMake(0, 0, view.bounds.width, 20))
    
    private func configureNavBar() {
        navigationController?.navigationBar.tintColor = .label
        navigationItem.title = nil
        navigationController?.navigationBar.prefersLargeTitles = false
        
        searchBar.placeholder = "Search product"
        searchBar.searchTextField.backgroundColor = UIColor.white
        
        let leftNavBarButton = UIBarButtonItem(customView: searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
        //navbar color
        navigationController?.navigationBar.backgroundColor = UIColor(rgb: 0x9cbee6)
        navigationController?.navigationBar.barTintColor = UIColor(rgb: 0x9cbee6)
//        navigationController?.navigationBar.tintColor = UIColor(rgb: 0x9cbee6)
        
    }
    
    private func setupApi() {
        self.homeViewModel = HomeViewModel(apiService: ApiService())
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
    
    func moveToMoreSalePage(data: ProductsModel?) {
        // Handle Sale section More button action
        let vc = MoreSaleController()
        vc.saleProductDatas = data
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func moveToBrowseAllProductsPage() {
        // Handle New Arrival section More button action
        let vc = MoreSaleController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0, 1, 2, 3, 4, 5, 6:
            return 1
            
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
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
        case .saleTitle:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderSectionTableCell.identifier, for: indexPath) as? HeaderSectionTableCell else {
                return UITableViewCell()
            }
            cell.setupCell(withSection: .sale) {
                self.delegate?.moveToMorePage(withTitle: "Sale")
            }
            cell.delegate = self.delegate
            return cell
        case .browseAllProductsTitle:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderSectionTableCell.identifier, for: indexPath) as? HeaderSectionTableCell else {
                return UITableViewCell()
            }
            cell.setupCell(withSection: .browseAllProducts) {
                
            }
            cell.delegate = self.delegate
            return cell
            // MARK: - header sections end
            
        case .categories:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CatTableCell.identifier, for: indexPath) as? CatTableCell else {
                return UITableViewCell()
            }
            
            cell.delegate = self
            
            cell.catDatas = storeDatas
            cell.catProduct = productDatas
            cell.setupTable()
            return cell
            
        case .sale:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SaleCollectionTableCell.identifier, for: indexPath) as? SaleCollectionTableCell else { return UITableViewCell()}
            
            cell.delegate = self
            cell.productDatas = productDatas
            cell.setupTable()
            
            cell.scrollDirection = .horizontal
            
            return cell
            
        case .browseAllProducts:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BrowseProductsTableCell.identifier, for: indexPath) as? BrowseProductsTableCell else {
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
        case .saleTitle, .browseAllProductsTitle:
            return UITableView.automaticDimension
        case .categories:
            return 200
        case .sale:
            return 350
        case .browseAllProducts:
            return 430
            
        default:
            return 0
        }
    }
    
}

extension HomeViewController: PageTransitionDelegate {
    
    
    func moveToOrderProductPage() {
        
    }
    
    func moveToCategoryPage(selectedCategory: String?) {
        let vc = CategoryController()
        
        vc.selectedCategory = selectedCategory
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func moveToDetailPage(data: Product?) {
        let vc = DetailItemController()
        
        guard let product = data else {return}
        vc.detailDatas = ProductsModel(products: [product])
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func moveToMorePage(withTitle title: String) {
        switch title {
        case "Sale":
            moveToMoreSalePage(data: productDatas)
        case "Browse Products":
            moveToBrowseAllProductsPage()
            
        default:
            break
        }
    }
}
