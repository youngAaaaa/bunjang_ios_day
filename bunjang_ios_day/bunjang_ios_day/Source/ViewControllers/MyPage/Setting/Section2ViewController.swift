//
//  Section2ViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/31.
//

import UIKit
import WebKit

class Section2ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    var requestURL = ""
    var receiveText = ""
    
    @IBAction func tapCloseButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label2.text = receiveText
        
        let myURL = URL(string: requestURL)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}

