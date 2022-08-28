//
//  Category2ViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/25.
//

import UIKit

//protocol CategoryDelegate2: AnyObject {
//    func chagedCategory(category1: String?, category2: String?, category3: String?)
//}

class Category2ViewController: UIViewController {
    
    //weak var delegate: CategoryDelegate2?
    
    var item: [Category2] = []
    var categoryName = ""
    var depth1 = 0
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = categoryName
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

extension Category2ViewController: UITableViewDelegate, UITableViewDataSource {
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
        let category2Name = item[indexPath.row].name
        let depth2 = item[indexPath.row].depth2ID
        
        Constant.category2Name = category2Name
        Constant.category2 = item[indexPath.row].depth2ID
        
        print("💜Category2ViewController💜")
        print("💞Constant.category2Name : \(Constant.category2Name)💞")
        print("💞Constant.category2 : \(Constant.category2)💞")
        
        if item[indexPath.row].hasMoreDepth{
            Category3DataManager().getCategory(depth1, depth2, categoryName, category2Name, delegate: self)
        }
        else {
            self.navigationController?.popToRootViewController(animated: true)
        }
        
    }

}

