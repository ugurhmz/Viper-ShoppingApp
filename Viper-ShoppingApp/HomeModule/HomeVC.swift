//
//  ViewController.swift
//  Viper-ShoppingApp
//
//  Created by ugur-pc on 29.04.2022.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    //func updateTitle(title: String) -> (Void)
    func updateGroceries(groceriesList: [GroceryItemGenerator]) -> ()
}



class HomeVC: UIViewController {

    //@IBOutlet weak var msgLabel: UILabel!
    var presenter: HomePresenterProtocol!
    
    var imgArr = ["apple","greengrapes","redgrapes", "strawberry", "watermelon"]
    var groceryItemList: [GroceryItemGenerator] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    
    var  topHeaderView: TopHeaderUIView?
    
 
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(HomeTableCell.self,
                           forCellReuseIdentifier: HomeTableCell.identifier)
        return tableView
    }()
    
   
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.fillSuperview()
        tableView.delegate = self
        tableView.dataSource = self
      
        
        setupConfigure()
    }
    
    private func setupConfigure(){
        self.presenter.viewDidLoad()
        
        topHeaderView = TopHeaderUIView(frame: CGRect(x: 0,
                                                      y: 0,
                                                      width: view.bounds.width,
                                                      height: 70))
        
        //tableView.tableHeaderView = topHeaderView
    }

}



//MARK: -
extension HomeVC: HomeViewProtocol {
    
    func updateGroceries(groceriesList: [GroceryItemGenerator]) {
        print("list", groceriesList)
        self.groceryItemList = groceriesList
        self.tableView.reloadData()
    }
    
    
//    func updateTitle(title: String) {
//        //msgLabel.text = "Hello \(title)"
//    }
}


//MARK: - UITableViewDelegate
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.groceryItemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableCell.identifier,
                                                   for: indexPath) as! HomeTableCell
        
        cell.configure(groceryItem: self.groceryItemList[indexPath.row])
            
        
        // add to bag trigger
        let viewModel = AddBagViewModel(title: "Add to bag", stepValue: 0)
        cell.addToBagClosure(usingViewModel: viewModel) { (val) in
            print("val \(val)")
        }
        
        cell.layer.borderWidth = 0.6
        cell.layer.borderColor = UIColor.lightGray.cgColor
       
          return cell
    }
      
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 150
    }
}
