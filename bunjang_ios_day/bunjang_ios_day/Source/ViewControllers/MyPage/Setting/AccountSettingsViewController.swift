//
//  AccountSettingsViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/09/01.
//

import UIKit

class AccountSettingsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingTableViewCell")
    }
    
    private func setCell(cell: SettingTableViewCell, section: Int, index: Int){
        if section == 0{
            cell.label.text = "연락처"
        }
        else if section == 1{
            cell.label.text = "SNS 연동"
        }
        else {
            cell.label.text = "탈퇴하기"
        }
    }

}

extension AccountSettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
            
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
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("section: \(indexPath.section), row: \(indexPath.row)")
//        let section = indexPath.section
//        let row = indexPath.row
//
//
//        switch section {
//        case 1:
//            switch row {
//            case 0:
//
//            case 1:
//
//            case 2:
//
//            default:
//                print("버전정보")
//            }
//        default:
//            print("/n")
//        }
//    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0:
//            return "사용자 설정"
//
//        case 1:
//            return "서비스 정보"
//
//        default:
//            return ""
//
//        }
//    }
    
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
    
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        guard let header = view as? UITableViewHeaderFooterView else { return }
//        header.textLabel?.textColor = UIColor.black
//        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 14)
//        header.textLabel?.frame = header.bounds
//    }
    
}

