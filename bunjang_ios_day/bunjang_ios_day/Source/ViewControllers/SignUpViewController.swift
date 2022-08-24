//
//  SignUpViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/21.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var birthTF: UITextField!
    @IBOutlet weak var genderTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    
    @IBAction func tapSignUpButton(_ sender: UIButton) {
        
        // 폰번호
        let inputPhoneNum = phoneTF.text!
        let phoneNum = "\(String(Array(inputPhoneNum)[0...2]))-\(String(Array(inputPhoneNum)[3...6]))-\(String(Array(inputPhoneNum)[7...10]))"
        print(phoneNum)

        //생일
        let birth = birthTF.text!
        var addText = ""
        if Array(birth)[0] == "0" || Array(birth)[0] == "1" || Array(birth)[0] == "2"{
            addText = "20"
        } else { addText = "19" }

        print(addText+birth)

        //성별
        var gender = genderTF.text!
        if gender == "2" || gender == "4"{
            gender = "f"
        } else { gender = "m" }



        let request = SignUpRequest(name: nameTF.text!,
                                    birth: addText+birth,
                                    gender: gender,
                                    phone: phoneNum,
                                    password: passwordTF.text!)
        SignUpDataManager().postSignUp(request, delegate: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpButton.layer.cornerRadius = 10
    }

}
