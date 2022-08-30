//
//  MyPageTabbarViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/30.
//

import UIKit
import Tabman
import Pageboy

class MyPageTabbarViewController: TabmanViewController {
    
    private var viewControllers: Array<UIViewController> = []
    @IBOutlet weak var tempView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    private func configureView(){
        let salesVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SalesViewController") as! SalesViewController
        let reservedVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReservedViewController") as! ReservedViewController
        let closedVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ClosedViewController") as! ClosedViewController
        
        viewControllers.append(salesVC)
        viewControllers.append(reservedVC)
        viewControllers.append(closedVC)
        
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        //        let bar = TMBar.TabBar()
        bar.backgroundView.style = .blur(style: .regular)
        //bar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
        bar.buttons.customize { (button) in
            button.tintColor = .lightGray // 선택 안되어 있을 때
            button.selectedTintColor = .black // 선택 되어 있을 때
            button.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            button.selectedFont = UIFont.systemFont(ofSize: 15, weight: .semibold)
        }
        // 인디케이터 조정
        bar.indicator.weight = .custom(value: 3)
        bar.indicator.tintColor = .black
        bar.indicator.overscrollBehavior = .compress
        bar.layout.alignment = .centerDistributed
        bar.layout.contentMode = .intrinsic
        bar.layout.interButtonSpacing = 10 // 버튼 사이 간격
        
        bar.layout.transitionStyle = .snap // Customize
        
        // Add to view
        addBar(bar, dataSource: self, at: .custom(view: tempView, layout: nil))
    }

}
extension MyPageTabbarViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "판매중")
        case 1:
            return TMBarItem(title: "예약중")
        case 2:
            return TMBarItem(title: "판매완료")
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
