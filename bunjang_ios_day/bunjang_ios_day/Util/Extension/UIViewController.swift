//
//  UIViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/21.
//

import UIKit

extension UIViewController {
    
    var statusBarView: UIView? {
        if #available(iOS 13.0, *) {
            let statusBarFrame = UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame
            if let statusBarFrame = statusBarFrame {
                let statusBar = UIView(frame: statusBarFrame)
                view.addSubview(statusBar)
                return statusBar
            } else {
                return nil
            }
        } else {
            return UIApplication.shared.value(forKey: "statusBar") as? UIView
        }
    }
    
    // MARK: 빈 화면을 눌렀을 때 키보드가 내려가도록 처리
    func dismissKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer =
        UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        //        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(false)
    }
    
    // MARK: UIWindow의 rootViewController를 변경하여 화면전환
    func changeRootViewController(_ viewControllerToPresent: UIViewController) {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = viewControllerToPresent
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil)
        } else {
            viewControllerToPresent.modalPresentationStyle = .overFullScreen
            self.present(viewControllerToPresent, animated: true, completion: nil)
        }
    }
}
