//
//  SalesViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/30.
//

import UIKit
import Kingfisher

class SalesViewController: UIViewController {
    
    var salesDataList : [SalesResult] = []
    
    @IBOutlet weak var cntNumber: UILabel!
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.register(UINib(nibName: "MyPageTableViewCell", bundle: nil), forCellReuseIdentifier: "MyPageTableViewCell")
        tableView.register(UINib(nibName: "EmptyMyPageTableViewCell", bundle: nil), forCellReuseIdentifier: "EmptyMyPageTableViewCell")
        
        setDatas()
    }
    
    private func setDatas(){
        SalesDataManager().getSalesData(storeID: Constant.storeID!, delegate: self)
    }

}

extension SalesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if salesDataList.count == 0{
            return 1
        } else {
            return salesDataList.count
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if salesDataList.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyMyPageTableViewCell", for: indexPath) as! EmptyMyPageTableViewCell
            cell.selectionStyle = .none
            cell.label.text = "판매중인 상품이 없습니다."
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageTableViewCell", for: indexPath) as! MyPageTableViewCell
            cell.selectionStyle = .none
            cell.priceLabel.text = "\(salesDataList[indexPath.row].price)"
            cell.titleLabel.text = "\(salesDataList[indexPath.row].title)"
            
            let imageURL = URL(string: salesDataList[indexPath.row].imageUrl01)
            cell.photoView.kf.setImage(with: imageURL)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if salesDataList.count == 0{
            return 250
        } else {
            return 170
            
        }
    }
}
