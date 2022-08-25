//
//  Category3ViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/25.
//

import UIKit

protocol CategoryDelegate: AnyObject {
    func chagedCategory(category1: String?, category2: String?, category3: String?)
}

class Category3ViewController: UIViewController {
    
    weak var delegate: CategoryDelegate?
    
    var item: [Category3] = []
    var category1Name = ""
    var category2Name = ""
    
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var name2: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name1.text = category1Name
        name2.text = category2Name
        setTableView()
    }
    
    func setTableView(){
        let categoryCell = UINib(nibName: "CategoriesTableViewCell", bundle: nil)
        tableView.register(categoryCell, forCellReuseIdentifier: "CategoriesTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }

}

extension Category3ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell", for: indexPath) as! CategoriesTableViewCell
        cell.selectionStyle = .none
        cell.categoryName.text = item[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category3Name = item[indexPath.row].name
        let categoryText = "\(category1Name) 🐣\(category2Name) 🐬\(category3Name)"
        Constant.categoryName = categoryText
        print(categoryText)
        print(Constant.categoryName)
        
        if !item[indexPath.row].hasMoreDepth{
            
            self.delegate?.chagedCategory(category1: category1Name, category2: category2Name, category3: category3Name)
            self.navigationController?.popToRootViewController(animated: true)
        }
        
    }

}
