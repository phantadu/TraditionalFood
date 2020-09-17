//
//  ChangepasswordViewController.swift
//  TraditionalFood
//
//  Created by phan tá dự on 9/15/20.
//  Copyright © 2020 phan tá dự. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class ChangepasswordViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
        @IBOutlet weak var oldpassword: UITextField!
        @IBOutlet weak var newpassword: UITextField!
   
          override func viewDidLoad() {
    super.viewDidLoad()
            oldpassword.isSecureTextEntry = true
            newpassword.isSecureTextEntry = true
         
            email.delegate = self
           oldpassword.delegate = self
           newpassword.delegate = self
        
    }
    func changePassword(email: String, oldpassword: String, newpassword: String,  completion: @escaping (Error?) -> Void) {
        let credential = EmailAuthProvider.credential(withEmail: email, password: oldpassword )
        Auth.auth().currentUser?.reauthenticate(with: credential, completion: { (result, error) in
            if let error = error {
                completion(error)
            }
            else {
                Auth.auth().currentUser?.updatePassword(to: newpassword , completion: { (error) in
                    completion(error)
                })
            }
        })
    }
    @IBAction func changepassword() {
           
        self.changePassword(email: email.text!, oldpassword: oldpassword.text!, newpassword: newpassword.text!) { (error) in
               if error == nil {
                   let alert = UIAlertController(title: "Thành công", message: "Mật khẩu của bạn đã được thay đổi", preferredStyle: .alert)
                   let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                   alert.addAction(action)
                   self.present(alert, animated: true, completion:nil )
               } else {
                   let alert = UIAlertController(title: "Lỗi", message: error?.localizedDescription, preferredStyle: .alert)
                   let action = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                   alert.addAction(action)
                   self.present(alert, animated: true, completion: nil)
               }
           }
       }

    
}
extension ChangepasswordViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if !textField.text!.isEmpty == true{
            if textField == email {
                email.resignFirstResponder()
                oldpassword.becomeFirstResponder()
            } else if (textField == oldpassword) {
               oldpassword.resignFirstResponder()
                newpassword.becomeFirstResponder()
            } else {
                newpassword.resignFirstResponder()
            }
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == email {
            textField.returnKeyType = .continue
        } else if (textField == oldpassword) {
            textField.returnKeyType = .continue
        } else {
            textField.returnKeyType = .done
        }
    }
    
}
