//
//  TabmanBottomVC.swift
//  2come1
//
//  Created by MacBook on 3/2/20.
//  Copyright © 2020 Popovic d.o.o. All rights reserved.
//

import Foundation
import UIKit
import Tabman
import Pageboy

extension UIView {
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
}


class TabmanBottomVC: TabmanViewController {
    var nizVC :[UIViewController] = []
    let titleBarItems :[String] = ["Around", "Chat", "Match", "Profile"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupArrayVC()
        self.dataSource = self
        self.view.backgroundColor = BaseColor.black.value
        self.bounces = false
        self.isScrollEnabled = true
        // Create bar
        let bar = TMBar.TabBar()
        bar.layout.transitionStyle = .snap // Customize
        bar.backgroundColor = BaseColor.black.value
        bar.backgroundView.style = .clear
        let tmpTop = UIView()
        tmpTop.frame = CGRect(x: 0, y: 0, width:self.view.frame.size.width, height: 1.5)
        tmpTop.backgroundColor = BaseColor.gold.value

        bar.backgroundView.addSubview(tmpTop)
  
        bar.buttons.customize { (button) in
            button.tintColor = BaseColor.white.value
            button.selectedTintColor = BaseColor.gold.value
            
        }
        // Add to view
        addBar(bar, dataSource: self, at: .bottom)
        
    }
    func setupArrayVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        self.nizVC.append(storyboard.instantiateViewController(withIdentifier: "VC1"))
        
        self.nizVC.append(storyboard.instantiateViewController(withIdentifier: "VC2"))
        
        self.nizVC.append(storyboard.instantiateViewController(withIdentifier: "VC3"))
        
        self.nizVC.append(storyboard.instantiateViewController(withIdentifier: "VC4"))
        self.reloadData()
    }
}
extension TabmanBottomVC: PageboyViewControllerDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return self.nizVC.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return self.nizVC[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    
}

extension TabmanBottomVC: TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let title = self.titleBarItems[index]
        
        switch index {
        case 0:
            return TMBarItem(title: title, image: TabBarIcon.around.value)
        case 1:
            return TMBarItem(title: title, image: TabBarIcon.chat.value)
        case 2:
            return TMBarItem(title: title, image: TabBarIcon.match.value)
        case 3:
            return TMBarItem(title: title, image: TabBarIcon.profile.value)
        default:
            return TMBarItem(title: title)
        }
        
    }
}
