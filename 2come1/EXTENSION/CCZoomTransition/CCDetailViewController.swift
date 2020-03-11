//
//  CCDetailViewController.swift
//  CCGitHubPro
//
//  Created by bo on 20/12/2016.
//  Copyright © 2016 bo. All rights reserved.
//

import UIKit

class CCDetailViewController: UIViewController {
    
    var imageView: UIImageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = BaseColor.white.value
        
       
        
        let closebutton = UIButton.init()
        closebutton.setTitle("X", for: .normal)
        closebutton.setTitleColor(BaseColor.gold.value, for: .normal)
        closebutton.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        
        closebutton.sizeToFit()
        closebutton.frame = CGRect.init(origin: CGPoint.init(x: 16, y: 20), size: closebutton.bounds.size)
        self.view.addSubview(closebutton)
        
        closebutton.addTarget(self, action: #selector(self.tapClose(sender:)), for: .touchUpInside)
        imageView.frame = self.view.bounds
        imageView.contentMode = .scaleAspectFill
        self.view.addSubview(imageView)
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.bringSubviewToFront(closebutton)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .default
        }
    }
    
    @objc func tapClose(sender : UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
