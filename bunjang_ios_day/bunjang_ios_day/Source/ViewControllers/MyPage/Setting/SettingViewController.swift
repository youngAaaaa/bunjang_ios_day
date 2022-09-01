//
//  SettingViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/31.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingTableViewCell")
    }
    
    private func setCell(cell: SettingTableViewCell, section: Int, index: Int){
        let section0 = ["계정 설정", "알림 설정", "우리동네 지역 설정", "배송지 설정", "계좌 설정", "간편결제 카드설정", "차단 상점 관리"]
        let section1 = ["이용약관", "개인정보 처리방침", "위치기반 서비스 이용약관", "버전정보 9.0.2"]
        let section2 = ["로그아웃"]
        
        if section == 0{
            cell.label.text = section0[index]
        }
        else if section == 1{
            cell.label.text = section1[index]
        }
        else {
            cell.label.text = section2[index]
        }
        
    }

}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 7
            
        case 1:
            return 4
            
        default:
            return 1
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
        cell.selectionStyle = .none
        setCell(cell: cell, section: indexPath.section, index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section: \(indexPath.section), row: \(indexPath.row)")
        let section = indexPath.section
        let row = indexPath.row
        
        let webVC = self.storyboard?.instantiateViewController(withIdentifier: "Section2ViewController") as! Section2ViewController
        
        switch section {
        case 0:
            switch row {
            case 0 :
                guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "AccountSettingsViewController") as? AccountSettingsViewController else { return }
                self.navigationController?.pushViewController(vc, animated: true)
            default:
                guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "AccountSettingsViewController") as? AccountSettingsViewController else { return }
                self.navigationController?.pushViewController(vc, animated: true)
            }
        case 1:
            switch row {
            case 0:
                webVC.receiveText = "서비스 이용약관"
                webVC.requestURL = "https://terms.bunjang.co.kr/terms/service.html"
                self.navigationController?.pushViewController(webVC, animated: true)
                
            case 1:
                webVC.receiveText = "개인정보처리방침"
                webVC.requestURL = "https://terms.bunjang.co.kr/terms/privacy.html"
                self.navigationController?.pushViewController(webVC, animated: true)
                
            case 2:
                webVC.receiveText = "위치기반서비스 이용약관"
                webVC.requestURL = "https://terms.bunjang.co.kr/terms/location.html"
                self.navigationController?.pushViewController(webVC, animated: true)
                
            default:
                print("버전정보")
            }
        default:
            print("/n")
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "사용자 설정"
            
        case 1:
            return "서비스 정보"
            
        default:
            return ""
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 50
        case 2:
            return 20

        default:
            return 30

        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = UIColor.black
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        header.textLabel?.frame = header.bounds
    }
    
}
