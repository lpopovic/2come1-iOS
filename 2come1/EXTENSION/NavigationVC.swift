//
//  NavigationVC.swift
//  BottomTabman
//
//  Created by MacBook on 3/2/20.
//  Copyright © 2020 Popovic d.o.o. All rights reserved.
//

import UIKit

class NavigationVC: SwipeNavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .black
    }
    
    func showTabManScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TabmanBottomVC") as! TabmanBottomVC
        self.pushViewController(vc,animated: true)
        self.emptyNavigationStack()
    }
    func emptyNavigationStack() {
        var navigationArray = self.viewControllers // To get all UIViewController stack as Array
        if let vc = navigationArray.last {
            navigationArray = [vc]
        }
        self.setViewControllers(navigationArray, animated: true)
        
    }
    
    func showMatchVCScreen(user: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MatchUserVC") as! MatchUserVC
        vc.currentUser = user
        self.pushViewController(vc,animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
