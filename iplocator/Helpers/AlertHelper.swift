//
//  AlertHelper.swift
//  iplocator
//
//  Created by derek quinn on 11/21/20.
//

import Foundation
import UIKit

class AlertHelper {
    static func showInvalidIpAlert(){
        let invalidIpAlert = UIElements.invalidIpAlert
        invalidIpAlert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
        invalidIpAlert.show()        
    }
}

extension UIAlertController {
    
    func show() {
        present(animated: true, completion: nil)
        
    }
    
    func present(animated: Bool, completion: (() -> Void)?) {
        if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
            presentFromController(controller: rootVC, animated: animated, completion: completion)
        }
    }
    
    private func presentFromController(controller: UIViewController, animated: Bool, completion: (() -> Void)?) {
        if let navVC = controller as? UINavigationController,
           let visibleVC = navVC.visibleViewController {
            presentFromController(controller: visibleVC, animated: animated, completion: completion)
        } else
        if let tabVC = controller as? UITabBarController,
           let selectedVC = tabVC.selectedViewController {
            presentFromController(controller: selectedVC, animated: animated, completion: completion)
        } else {
            controller.present(self, animated: animated, completion: completion);
        }
    }
}
