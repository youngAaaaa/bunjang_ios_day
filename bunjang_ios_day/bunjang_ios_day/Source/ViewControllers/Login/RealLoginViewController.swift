//
//  RealLoginViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/25.
//

import UIKit

class RealLoginViewController: UIViewController {
    
    @IBOutlet weak var idTF: UITextField!
    @IBOutlet weak var pwTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func tapLoginButton(_ sender: UIButton) {
        let inputPhoneNum = idTF.text!
        let phoneNum = "\(String(Array(inputPhoneNum)[0...2]))-\(String(Array(inputPhoneNum)[3...6]))-\(String(Array(inputPhoneNum)[7...10]))"
        print(phoneNum)
        let request = SignInRequest(phone: phoneNum, password: pwTF.text!)
        SignInDataManager().postSignIn(request, delegate: self)
        
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboardWhenTappedAround()

        loginButton.layer.cornerRadius = 10
        
        idTF.returnKeyType = .next
        pwTF.returnKeyType = .done
        
        idTF.delegate = self
        pwTF.delegate = self
    }

}
extension RealLoginViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text!.count > 0 {
            loginButton.backgroundColor = UIColor(named: "red1")
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == idTF{
            idTF.resignFirstResponder()
            pwTF.becomeFirstResponder()
        }
        if textField == pwTF{
            self.tapLoginButton(self.loginButton)
        }
        return true
    }
    
}
