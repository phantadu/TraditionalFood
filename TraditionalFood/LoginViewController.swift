//
//  LoginViewController.swift
//  TraditionalFood
//
//  Created by phan tá dự on 8/23/20.
//  Copyright © 2020 phan tá dự. All rights reserved.
//

import UIKit
import FirebaseAuth
class LoginViewController: UIViewController  {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func loginAction(_ sender: Any) {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            if error == nil{
                let vc = tabbarcontroller()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else{
                let alertController = UIAlertController(title: "Lỗi", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Đồng Ý", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.password.isSecureTextEntry = true
        email.delegate = self
    }
}
extension LoginViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if !textField.text!.isEmpty {
            if textField == email {
                email.resignFirstResponder()
                password.becomeFirstResponder()
            } else {
                password.resignFirstResponder()
            }
        }
        return true
    }
}
