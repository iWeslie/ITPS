//
//  AlertActionView.swift
//  ITPS
//
//  Created by Weslie on 2018/5/9.
//  Copyright © 2018 Weslie. All rights reserved.
//

import UIKit

class AlertActionView: UIView {

    var confirmHandler: (() -> Void)?
    
    @IBOutlet weak var hintMessageLbl: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var contentView: ShadowView!
    @IBOutlet weak var contentViewTopCons: NSLayoutConstraint!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor.init(white: 0.0, alpha: 0.0)
                
        /// spring content view
        let spring = CASpringAnimation(keyPath: "position.y")
        spring.fromValue =  contentView.layer.position.y + 200
        spring.toValue = contentView.layer.position.y
        spring.damping = 10
        spring.stiffness = 50
        spring.initialVelocity = 10
        spring.duration = spring.settlingDuration
        contentView.layer.add(spring, forKey: nil)
        
        UIView.animate(withDuration: 0.3) {
            self.backgroundColor = UIColor.init(white: 0.0, alpha: 0.6)
        }
        
        /// tap blank space to dismiss
        let tap = UITapGestureRecognizer(target: self, action: #selector(cancelBtnClicked(_:)))
        backgroundView.addGestureRecognizer(tap)
        
    }

    
    @IBAction func cancelBtnClicked(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut, animations: {
            self.backgroundColor = UIColor.init(white: 0.0, alpha: 0.0)
            self.contentView.alpha = 0.0
            self.contentViewTopCons.constant += 60
            self.layoutIfNeeded()
        }) { (_) in
            self.removeFromSuperview()
        }
    }
    
    @IBAction func confirmButtonClicked(_ sender: UIButton) {
        /// handle input text with closure
        if confirmHandler != nil {
            confirmHandler!()
        }
    }

}
