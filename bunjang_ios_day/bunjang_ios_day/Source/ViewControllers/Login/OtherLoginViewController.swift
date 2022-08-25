//
//  OtherLoginViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/24.
//

import UIKit

//protocol DismissDelegate {
//    func dismiss()
//}

class OtherLoginViewController: UIViewController {
    
    //var dismissDelegate: DismissDelegate?
    
    @IBAction func tapSignUpButton(_ sender: UIButton) {
        print("눌러짐")
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else { return }
        self.changeRootViewController(vc)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
