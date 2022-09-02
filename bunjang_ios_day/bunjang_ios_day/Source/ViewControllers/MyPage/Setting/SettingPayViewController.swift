//
//  SettingPayViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/09/02.
//

import UIKit

class SettingPayViewController: UIViewController {
    
    @IBAction func tapCloseButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bgView.layer.cornerRadius = 5
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = UIColor.systemGray5.cgColor
    }
    

}
