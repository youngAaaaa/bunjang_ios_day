//
//  SettingAddressViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/09/02.
//

import UIKit

class SettingAddressViewController: UIViewController {
    
    var receiveButton = ""
    var receiveMainLabel = ""
    var receiveLabel = ""

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    
    @IBAction func tapCloseButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        button.setTitle(receiveButton, for: .normal)
        mainLabel.text = receiveMainLabel
        label.text = receiveLabel
        
        bgView.layer.cornerRadius = 5
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = UIColor.systemGray5.cgColor
    }

}
