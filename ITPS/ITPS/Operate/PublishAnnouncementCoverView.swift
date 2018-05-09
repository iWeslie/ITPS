//
//  PublishAnnouncementCoverView.swift
//  ITPS
//
//  Created by Weslie on 2018/5/8.
//  Copyright © 2018 Weslie. All rights reserved.
//

import UIKit

class PublishAnnouncementCoverView: UIView {
    
    var presentClosure: (() -> Void)?

    @IBOutlet weak var backEffectView: UIVisualEffectView!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var labelBottomCons: NSLayoutConstraint!
    @IBOutlet weak var btnBottomCons: NSLayoutConstraint!
    
    override func awakeFromNib() {
        
        backEffectView.alpha = 0
        
        self.labelBottomCons.constant = 75
        self.btnBottomCons.constant = 100
        btn.alpha = 0
        lbl.alpha = 0
        
        /// Objects show animations
        UIView.animate(withDuration: 0.3) {
            self.backEffectView.alpha = 1
            self.btn.alpha = 1
            self.lbl.alpha = 1
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 8, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissCoverView))
        backEffectView.addGestureRecognizer(tap)
        
        /// remove the cover view when publish vc dismissed
        NotificationCenter.default.addObserver(self, selector: #selector(self.removeFromSuperview), name: NSNotification.Name.init(removePublishCoverViewNotification), object: nil)
        
    }
    
    @IBAction func publishBtnClicked(_ sender: UIButton) {
        
        if presentClosure != nil {
            presentClosure!()
        }
        
    }
    
    /// Tap to dismiss the cover view
    @objc func dismissCoverView() {
        UIView.animate(withDuration: 0.5, animations: {
            self.backEffectView.alpha = 0
            self.btn.alpha = 0
            self.lbl.alpha = 0
        }) { (_) in
            self.removeFromSuperview()
        }
    }
    
}
