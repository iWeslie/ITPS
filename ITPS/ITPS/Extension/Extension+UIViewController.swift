//
//  Extension+UIViewController.swift
//  ITPS
//
//  Created by Weslie on 2018/5/9.
//  Copyright © 2018 Weslie. All rights reserved.
//

import UIKit

/// Define swizzling function to change global navigation bar attributes
private let swizzling: (AnyClass, Selector, Selector) -> Void = { forClass, originSelector, swizzledSelector in
    let originalMethod = class_getInstanceMethod(forClass, originSelector)
    let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector)
    method_exchangeImplementations(originalMethod!, swizzledMethod!)
}

extension UIViewController {
    
    static let classInit: Void = {
        /// Change navigation bar tint color
        let originSelector = #selector(viewDidLoad)
        let swizzledSelector = #selector(tintedNavBar_viewDidLoad)
        swizzling(UIViewController.self, originSelector, swizzledSelector)
        
        /// Hide tab bar while the current vc is not root
        let originWillAppear = #selector(viewWillAppear(_:))
        let swizzledWillAppear = #selector(hideTabBar_viewWillAppear(_:))
        swizzling(UIViewController.self, originWillAppear, swizzledWillAppear)
    }()
    
    @objc private func tintedNavBar_viewDidLoad() {
        tintedNavBar_viewDidLoad()
        let backItem = UIBarButtonItem(title: nil, style: .plain, target: self, action: nil)
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.navigationItem.backBarButtonItem = backItem

        /// Init a dict for title attribute
        let attrDict = [NSAttributedStringKey.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = attrDict
    }
    
    @objc private func hideTabBar_viewWillAppear(_ animated: Bool) {
        hideTabBar_viewWillAppear(animated)
        let navController = self.navigationController
        if self == navController?.viewControllers.first {
            self.tabBarController?.tabBar.isHidden = false
        } else {
            self.tabBarController?.tabBar.isHidden = true
        }
    }
    
}

extension UIViewController {
    
    enum AlertViewType {
        case inputView
        case actionView
        case inputActionView
    }
    
    func presentAlertInputView(title: String, _ saveHandler: @escaping (_ inputText: String) -> Void) {
        let view = Bundle.main.loadNibNamed("AlertInputView", owner: nil, options: nil)?.first as! AlertInputView
        view.frame = screenRect
        view.titleLabel.text = title
        view.saveHanlder = saveHandler
        self.tabBarController?.view.addSubview(view)
    }
    
    func presentAlertAction(_ confirmHandler: @escaping () -> Void) {
        let view = Bundle.main.loadNibNamed("AlertActionView", owner: nil, options: nil)?.first as! AlertActionView
        view.frame = screenRect
        view.confirmHandler = confirmHandler
        self.tabBarController?.view.addSubview(view)
    }

}
