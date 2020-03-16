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
        
        var topSafeAreaHeight: CGFloat = 0
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.windows[0]
            let safeFrame = window.safeAreaLayoutGuide.layoutFrame
            topSafeAreaHeight = safeFrame.minY
            
        }
        
        let closebutton = UIButton.init()
        closebutton.setTitle("X", for: .normal)
        closebutton.backgroundColor = BaseColor.white.value
        closebutton.setTitleColor(BaseColor.black.value, for: .normal)
        closebutton.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        closebutton.frame = CGRect(x: 16, y: topSafeAreaHeight, width: 50, height: 50)
        closebutton.layer.cornerRadius = 25
        closebutton.layer.borderWidth = 2
        closebutton.layer.borderColor = BaseColor.black.value.cgColor
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
            return .lightContent
        }
    }
    
    @objc func tapClose(sender : UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
