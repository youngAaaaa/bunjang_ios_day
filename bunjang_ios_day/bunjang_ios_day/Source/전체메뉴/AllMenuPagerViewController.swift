//
//  AllMenuPagerViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/23.
//

import UIKit
import Tabman
import Pageboy

class AllMenuPagerViewController: TabmanViewController {
    
    private var viewControllers: Array<UIViewController> = []
    @IBOutlet weak var tempView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    private func configureView(){
        let categoriesVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CategoriesViewController") as! CategoriesViewController
        let brandVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BrandsViewController") as! BrandsViewController
        let serviceVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ServiceViewController") as! ServiceViewController
        
        viewControllers.append(categoriesVC)
        viewControllers.append(brandVC)
        viewControllers.append(serviceVC)
        
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        //        let bar = TMBar.TabBar()
        bar.backgroundView.style = .blur(style: .regular)
        bar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
        bar.buttons.customize { (button) in
            button.tintColor = .lightGray // 선택 안되어 있을 때
            button.selectedTintColor = .black // 선택 되어 있을 때
            button.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
            button.selectedFont = UIFont.systemFont(ofSize: 13, weight: .semibold)
        }
        // 인디케이터 조정
        bar.indicator.weight = .custom(value: 3)
        bar.indicator.tintColor = .black
        bar.indicator.overscrollBehavior = .compress
        bar.layout.alignment = .centerDistributed
        bar.layout.contentMode = .fit
        bar.layout.interButtonSpacing = 0 // 버튼 사이 간격
        
        bar.layout.transitionStyle = .snap // Customize
        
        // Add to view
        addBar(bar, dataSource: self, at: .custom(view: tempView, layout: nil))
    }

}

extension AllMenuPagerViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "카테고리")
        case 1:
            return TMBarItem(title: "브랜드")
        case 2:
            return TMBarItem(title: "서비스")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
        
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
}
