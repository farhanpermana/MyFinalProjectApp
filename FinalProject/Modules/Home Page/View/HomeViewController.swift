//
//  HomeViewController.swift
//  FinalProject
//
//  Created by Farhan Permana on 27/04/23.
//

import UIKit
import SkeletonView

// MARK: - home sections
// defines a finite set of home sections values
enum HomeSection: Int {
    case carousel = 0
    case categories = 1
    case saleTitle = 2
    case sale = 3
    case browseAllProductsTitle = 4
    case browseAllProducts = 5
}

// MARK: - pagetransition protocol
protocol PageTransitionDelegate: AnyObject {
    func moveMoreButton(withTitle title: String?)
    func moveToDetailPage(data: Product?)
    func moveToCategoryPage(selectedCategory: String?)
}

class HomeViewController: UIViewController {
    
    var storeViewModel: StoreViewModel?
    
    private var storeDatas: StoreModel?
    private var catDatas: ProductCategory?
    private var productDatas: ProductsModel?
    
    // MARK: using weak to avoid memory leak, delegate will be deleted if not needed on memory. delegate tidak akan mempertahankan objek tersebut dalam memory
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
        searchBar.searchTextField.backgroundColor = UIColor(rgb: 0x75001d)
        searchBar.searchTextField.textColor = .white
        searchBar.searchTextField.leftView?.tintColor = .white
        searchBar.searchTextField.tintColor = .white
        // placeholder color
        let placeholderAppearance = UILabel.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        placeholderAppearance.textColor = .white
        
        let leftNavBarButton = UIBarButtonItem(customView: searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
        
    }
    
    fileprivate func setupApi() {
        self.storeViewModel = StoreViewModel(apiService: ApiService())
        self.storeViewModel?.bindListData = {
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
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func moveToBrowseAllProductsPage(data: ProductsModel?) {
        // Handle New Arrival section More button action
        let vc = BrowseAllController()
        vc.browseProductDatas = data
        vc.hidesBottomBarWhenPushed = true
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
            
            // MARK: - reusable header sections start
        case .saleTitle:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderSectionTableCell.identifier, for: indexPath) as? HeaderSectionTableCell else {
                return UITableViewCell()
            }
            cell.setupCell(withSection: .sale) {
                self.delegate?.moveMoreButton(withTitle: "Sale")
            }
            cell.delegate = self.delegate
            return cell
        case .browseAllProductsTitle:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderSectionTableCell.identifier, for: indexPath) as? HeaderSectionTableCell else {
                return UITableViewCell()
            }
            cell.setupCell(withSection: .browseAllProducts) {
                self.delegate?.moveMoreButton(withTitle: "Browse Products")
            }
            cell.delegate = self.delegate
            return cell
            // MARK: - header sections end
            
        case .carousel:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CarouselTableCell.identifier, for: indexPath) as? CarouselTableCell else {
                return UITableViewCell()
            }
            cell.carouselDatas = storeDatas
            
            cell.setupTable()
            return cell
            
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
            
            return cell
            
        case .browseAllProducts:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BrowseProductsTableCell.identifier, for: indexPath) as? BrowseProductsTableCell else {
                return UITableViewCell()
            }
            cell.delegate = self
            cell.browseProductsDatas = productDatas
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
            return 160
        case .sale:
            return 340
        case .browseAllProducts:
            return 600
            
        default:
            return 0
        }
    }
    
}

extension HomeViewController: PageTransitionDelegate {
    
    
    func moveToCategoryPage(selectedCategory: String?) {
        let vc = CategoryController()
        vc.hidesBottomBarWhenPushed = true
        // store category to string selectedCategory
        vc.selectedCategory = selectedCategory
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // move to detail
    func moveToDetailPage(data: Product?) {
        let vc = DetailItemController()
        // disable tabbar
        vc.hidesBottomBarWhenPushed = true
        guard let product = data else {return}
        // convert to array product
        vc.detailDatas = ProductsModel(products: [product])
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    // MARK: - More Button with title
    func moveMoreButton(withTitle title: String?) {
        switch title {
        case "Sale":
            moveToMoreSalePage(data: productDatas)
        case "Browse Products":
            moveToBrowseAllProductsPage(data: productDatas)
            
        default:
            break
        }
    }
}
