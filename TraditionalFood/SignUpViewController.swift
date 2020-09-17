//
//  SignUpViewController.swift
//  TraditionalFood
//
//  Created by phan tá dự on 8/23/20.
//  Copyright © 2020 phan tá dự. All rights reserved.
//

import UIKit
import FirebaseAuth
class SignUpViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConfirm: UITextField!
    
    @IBAction func signUpAction(_ sender: Any) {
        if password.text != passwordConfirm.text {
            let alertController = UIAlertController(title: "Mật khẩu không chính xác", message: "Vui lòng nhập lại mật khẩu", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Đồng Ý", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else{
            Auth.auth().createUser(withEmail: email.text!, password: password.text!){ (user, error) in
                if error == nil {
                    let vc = StartViewController()
                    self.navigationController?.popViewController(animated: true)
                }
                else{
                    let alertController = UIAlertController(title: "Lỗi", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "Đồng Ý", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        password.isSecureTextEntry = true
        passwordConfirm.isSecureTextEntry = true
        password.delegate = self
        email.delegate = self
        passwordConfirm.delegate = self
    }
}
extension SignUpViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if !textField.text!.isEmpty {
            if textField == email {
                email.resignFirstResponder()
                password.becomeFirstResponder()
            } else if (textField == password) {
                password.resignFirstResponder()
                passwordConfirm.becomeFirstResponder()
            } else {
                passwordConfirm.resignFirstResponder()
            }
        }
        return true
    }
}
