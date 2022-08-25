//
//  Category1ViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/25.
//

import UIKit

class Category1ViewController: UIViewController {
    
    var item : [Category1] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
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
extension Category1ViewController: UITableViewDelegate, UITableViewDataSource {
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
        print(indexPath.row)
        print(item[indexPath.row].depth1ID)
        if item[indexPath.row].hasMoreDepth{
            let categoryName = item[indexPath.row].name
            let depth = item[indexPath.row].depth1ID
            Category2DataManager().getCategory(depth, categoryName, delegate: self)
        }
    }

}
