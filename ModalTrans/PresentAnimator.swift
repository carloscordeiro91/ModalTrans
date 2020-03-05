//
//  PresentAnimator.swift
//  ModalTrans
//
//  Created by itsector on 05/03/2020.
//  Copyright © 2020 itsector. All rights reserved.
//

import Foundation
import UIKit

class PresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromView = transitionContext.viewController(forKey: .from)?.view else { return }
        
        guard let toView = transitionContext.viewController(forKey: .to)?.view else { return }
        
        toView.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        toView.alpha = 0
        
        transitionContext.containerView.addSubview(fromView)
        
        transitionContext.containerView.addSubview(toView)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toView.transform = CGAffineTransform.identity
            
            toView.alpha = 1.0
            
        }) { (success) in
            
            transitionContext.completeTransition(true)
        }
        
    }
}

