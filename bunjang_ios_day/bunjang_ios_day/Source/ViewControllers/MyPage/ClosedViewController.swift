//
//  ClosedViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/30.
//

import UIKit
import Kingfisher

class ClosedViewController: UIViewController {
    
    @IBOutlet weak var cntNumber: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var closedDataList : [ClosedResult] = []

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
        ClosedDataManager().getClosedData(storeID: Constant.storeID!, delegate: self)
    }
}

extension ClosedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if closedDataList.count == 0{
            return 1
        } else {
            return closedDataList.count
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if closedDataList.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyMyPageTableViewCell", for: indexPath) as! EmptyMyPageTableViewCell
            
            cell.selectionStyle = .none
            cell.label.text = "판매완료 상품이 없습니다."
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageTableViewCell", for: indexPath) as! MyPageTableViewCell
            cell.selectionStyle = .none
            cell.priceLabel.text = "\(closedDataList[indexPath.row].price)"
            cell.titleLabel.text = "\(closedDataList[indexPath.row].title)"
            
            let imageURL = URL(string: closedDataList[indexPath.row].imageUrl01)
            cell.photoView.kf.setImage(with: imageURL)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if closedDataList.count == 0{
            return 250
        } else {
            return 170
            
        }
    }
}
