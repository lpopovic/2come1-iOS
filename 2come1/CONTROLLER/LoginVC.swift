//
//  LoginVC.swift
//  2come1
//
//  Created by Marko Srdanovic on 03/03/2020.
//

import UIKit

class LoginVC: BaseVC {
    
    @IBOutlet weak var usernameOrEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var usernameOrEmailTextFieldLine: UIView!
    @IBOutlet weak var passwordTextFieldLine: UIView!
    @IBOutlet weak var usernameOrEmailTextFieldLineHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordTextFieldLineHeightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        usernameOrEmailTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    @IBAction func loginBtnPressAction(_ sender: UIButton) {
       
        if let nvc = self.navigationController as? NavigationVC {
            nvc.showTabManScreen()
        }
    }
    
    @IBAction func registerBtnPressAction(_ sender: Any) {
//        view.endEditing(true)
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let controller = storyboard.instantiateViewController(withIdentifier: "RegisterVC")
//        let transition = CATransition()
//        transition.duration = 0.35
//        transition.type = CATransitionType.push
//        transition.subtype = CATransitionSubtype.fromRight
//        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
//        self.view.window!.layer.add(transition, forKey: kCATransition)
//        controller.modalPresentationStyle = .fullScreen
//        self.present(controller, animated: false, completion: nil)
    }
    @IBAction func unwindToLoginVC(segue:UIStoryboardSegue) { }
}
extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == usernameOrEmailTextField {
            usernameOrEmailTextFieldLineHeightConstraint.constant = 2.0
            passwordTextFieldLineHeightConstraint.constant = 1.5
            usernameOrEmailTextFieldLine.backgroundColor = .black
            passwordTextFieldLine.backgroundColor = .gray
        } else if textField == passwordTextField {
            passwordTextFieldLineHeightConstraint.constant = 2.0
            usernameOrEmailTextFieldLineHeightConstraint.constant = 1.5
            passwordTextFieldLine.backgroundColor = .black
            usernameOrEmailTextFieldLine.backgroundColor = .gray
        }
    }
}
