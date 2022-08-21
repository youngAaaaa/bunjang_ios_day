//
//  SignUpViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/21.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var teleView: UIView!
    @IBOutlet weak var birthView: UIView!
    
    
    @IBAction func tapTeleButton(_ sender: UIButton) {
        phoneView.isHidden = false
    }
    
    @IBAction func tapBirthButton(_ sender: UIButton) {
        teleView.isHidden = false
    }
    
    @IBAction func tapNameButton(_ sender: UIButton) {
        birthView.isHidden = false
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
