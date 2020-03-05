//
//  DismissAnimator.swift
//  ModalTrans
//
//  Created by itsector on 05/03/2020.
//  Copyright © 2020 itsector. All rights reserved.
//

import Foundation

import UIKit

class DismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromView = transitionContext.viewController(forKey: .from)?.view else { return }
        
        guard let toView = transitionContext.viewController(forKey: .to)?.view else { return }
        
        transitionContext.containerView.addSubview(toView)
        
        transitionContext.containerView.bringSubviewToFront(fromView)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            fromView.alpha = 0
        }) { (success) in
            
        }
        
    }
}
