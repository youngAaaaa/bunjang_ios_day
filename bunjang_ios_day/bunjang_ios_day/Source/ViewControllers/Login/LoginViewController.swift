//
//  LoginViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/20.
//

import UIKit
import ImageSlideshow

class LoginViewController: UIViewController {
    
    @IBOutlet weak var imageSlidesShow: ImageSlideshow!
    let imageInputs = [
        ImageSource(image: Image.login1),
        ImageSource(image: Image.login2),
        ImageSource(image: Image.login3),
        ImageSource(image: Image.login4)
    ]
    
    @IBAction func tapOtherLoginButton(_ sender: UIButton) {
        presentReviewModalViewController()
    }
    
    @IBAction func tapLoginButton(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RealLoginViewController") as! RealLoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    
    private func configureView() {
        imageSlidesShow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        imageSlidesShow.contentScaleMode = .scaleAspectFit
        
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = .black
        pageIndicator.pageIndicatorTintColor = .systemGray5
        imageSlidesShow.pageIndicator = pageIndicator
        
        imageSlidesShow.activityIndicator = DefaultActivityIndicator()
        imageSlidesShow.delegate = self
        
        imageSlidesShow.setImageInputs(imageInputs)
    }
    
}

extension LoginViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        print("current page:", page)
    }
}

extension LoginViewController: UIViewControllerTransitioningDelegate {
    private func presentReviewModalViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "OtherLoginViewController") as? OtherLoginViewController else {
            return
        }
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        present(vc, animated: true, completion: nil)
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return HalfModalPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
//extension LoginViewController: DismissDelegate {
//    func dismiss() {
//        self.dismiss(animated: true) {
//            print("로그인 뷰 디스미스")
//        }
//    }
//}
