//
//  HalfModalPresentationController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/24.
//

import UIKit

class HalfModalPresentationController: UIPresentationController {
    
    let blurEffectView: UIVisualEffectView!
    var tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer()
    var check: Bool = false
    
    var proportionalHeight: Double = 0.5
    var proportianoalYPosition: Double = 470 / 800
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        let blurEffect = UIBlurEffect(style: .systemThickMaterialDark)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        super.init(presentedViewController: presentedViewController, presenting: presentedViewController)
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissController))
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.blurEffectView.isUserInteractionEnabled = true
        self.blurEffectView.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        CGRect(origin: CGPoint(x: 0,
                               y: self.containerView!.frame.height * proportianoalYPosition),
               size: CGSize(width: self.containerView!.frame.width,
                            height: self.containerView!.frame.height * proportionalHeight))
    }
    
    override func presentationTransitionWillBegin() {
        self.blurEffectView.alpha = 0
        self.containerView!.addSubview(blurEffectView)
        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in self.blurEffectView.alpha = 0.5},
                                                                    completion: nil)
        
    }
    
    
    override func dismissalTransitionWillBegin() {
        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in self.blurEffectView.alpha = 0},
                                                                    completion: { _ in self.blurEffectView.removeFromSuperview()})
    }
    
    
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        blurEffectView.frame = containerView!.bounds
       
      
        self.presentedView?.layer.masksToBounds = true
        self.presentedView?.layer.cornerRadius = 20
        self.presentedView!.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner, .layerMinXMinYCorner)
    }
    
    @objc func dismissController() {
        self.presentedViewController.dismiss(animated: true, completion: nil)
    }
}
