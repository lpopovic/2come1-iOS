//
//  RegisterVC.swift
//  2come1
//
//  Created by Marko Srdanovic on 03/03/2020.
//

import UIKit

class RegisterVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func closeBtnPressAction(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "unwindSegueToLoginVC", sender: self)
    }

}
extension UIViewController {
    
    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.35
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false)
    }
}
