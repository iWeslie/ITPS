//
//  LoginViewController.swift
//  ITPS
//
//  Created by Weslie on 2018/5/8.
//  Copyright © 2018 Weslie. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    /// Error info label text enum
    private enum LoginErrorInfo: String {
        case accountNil = "请输入账号"
        case passwordNil = "请输入密码"
        case serverNil = "请选择服务器"
        case verifyFailed = "账号或密码输入错误，请重新输入!"
    }

    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var logoImgTopCons: NSLayoutConstraint!
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var backgroundImgTopCons: NSLayoutConstraint!
    @IBOutlet weak var loginViewTopCons: NSLayoutConstraint!
    
    @IBOutlet weak var shadowView: ShadowView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var errorLbl: UILabel!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(moveUpViews), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(moveDownViews), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimation()
    }
    
    @IBAction func loginBtnClicked(_ sender: ShadowButton) {
        /// Request login
        wiggleErrorInfo(.verifyFailed)
    }
    
    @IBAction func temp(_ sender: UIButton) {
        UIApplication.shared.keyWindow?.rootViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController()!
    }
    
    
}

extension LoginViewController {
    /// Prepare for animations
    func setupUI() {
        logoImgTopCons.constant = 36
        logoImg.alpha = 0
        shadowView.alpha = 0
        loginView.alpha = 0
        backgroundImg.alpha = 0
    }
    
    /// Start UI Animations
    func startAnimation() {
        /// spring logo
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10.0, options: .curveEaseOut, animations: {
            self.logoImgTopCons.constant = isIPHONE_SE ? 66 : 126
            self.logoImg.alpha = 1
            self.view.layoutIfNeeded()
        }) { _ in
            /// alpha fade in
            UIView.animate(withDuration: 0.8) {
                self.shadowView.alpha = 0.8
                self.loginView.alpha = 1
                self.backgroundImg.alpha = 1
            }
            
            /// background image animation
            UIView.animate(withDuration: 1.2, delay: 0.0, options: .curveEaseOut, animations: {
                self.backgroundImgTopCons.constant = 0
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            /// login view animation
            UIView.animate(withDuration: 0.8, delay: 0.0, options: .curveEaseOut, animations: {
                if isIPHONE_SE {
                    self.loginViewTopCons.constant = 146
                } else {
                    self.loginViewTopCons.constant = 220
                }
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    /// Move up views when keyboard will show
    @objc func moveUpViews() {
        logoImgTopCons.constant = 18
        loginViewTopCons.constant = 120
        
        UIView.animate(withDuration: 0.6, delay: 0.0, options: .curveEaseInOut, animations: {
            self.logoImg.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    /// Move down views when keyboard will hide
    @objc func moveDownViews() {
        if isIPHONE_SE {
            logoImgTopCons.constant = 66
            loginViewTopCons.constant = 146
        } else {
            loginViewTopCons.constant = 220
            logoImgTopCons.constant = 126
        }
        
        UIView.animate(withDuration: 0.6, delay: 0.0, options: .curveEaseInOut, animations: {
            self.logoImg.transform = CGAffineTransform.identity
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    /// Show error info label and wiggle
    private func wiggleErrorInfo(_ warnInfo: LoginErrorInfo) {
        let shake = CABasicAnimation.init(keyPath: "transform.translation.x")
        shake.fromValue = -5
        shake.toValue = 5
        shake.duration = 0.08
        shake.autoreverses = true
        shake.repeatCount = 2
        
        self.errorLbl.isHidden = false
        self.errorLbl.text = warnInfo.rawValue
        
        self.errorLbl.layer.add(shake, forKey: nil)
    }
}
