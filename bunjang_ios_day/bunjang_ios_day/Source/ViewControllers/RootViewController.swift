//
//  RootViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/09/01.
//

import UIKit

class RootViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
    }
    
}

extension RootViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.title == "등록"{
            print("검색")
            let storyboard = UIStoryboard(name: "Registeration", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: "RegisterationNavigationController") as? UINavigationController else {
                return false
            }
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
            
            return false
        }
        return true
    }
}
