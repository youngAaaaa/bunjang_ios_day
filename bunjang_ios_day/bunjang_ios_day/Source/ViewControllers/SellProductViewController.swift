//
//  SellProductViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/25.
//

import UIKit

class SellProductViewController: UIViewController {
    
    @IBOutlet weak var categoryText: UILabel!
    @IBOutlet weak var categoryText2: UILabel!
    @IBOutlet weak var categoryText3: UILabel!
    
    @IBAction func tapBackButton(_ sender: Any) {
//        self.changeRootViewController(<#T##viewControllerToPresent: UIViewController##UIViewController#>)
    }
    
    
    
    @IBAction func tapCategoryButton(_ sender: Any) {
        Category1DataManager().getCategory(delegate: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        categoryText2.text = ""
        categoryText3.text = ""
    }
    

}
//extension SellProductViewController: CategoryDelegate {
//    func chagedCategory(category1: String, category2: String, category3: String){
//        categoryText.text = category1
//        categoryText2.text = category2
//        categoryText3.text = category3
//        
//        categoryText.textColor = .black
//        categoryText2.textColor = .black
//        categoryText3.textColor = .black
//    }
//}
