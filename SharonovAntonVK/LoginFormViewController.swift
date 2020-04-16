//
//  LoginFormViewController.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 31/03/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

class LoginFormViewController: UIViewController {
    
    @IBOutlet weak var scrollBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginIcon: UIImageView!

    override func viewDidAppear(_ animated: Bool) {
        UIView.transition(
            with: loginIcon,
            duration: 1.4,
            options: [
                .transitionFlipFromRight,
                .repeat
            ],
            animations: {}
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWasShown(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == "loginSegue" else { return true }
        let isAuth = auth()
        
        if !isAuth {
            showAuthError()
        }
        
        return isAuth
    }
    
    func auth() -> Bool {
        let login = loginTF.text!
        let password = passwordTF.text!
        
        return login == "admin" && password == "123456"
    }
    
    func showAuthError() {
        let alert = UIAlertController(title: "Error", message: "Incorrect login or password", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        print("Неверный логин или пароль")
    }
    
    
    @objc func keyboardWasShown(notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo as! [String: Any]
        let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        
        scrollBottomConstraint.constant = frame.height
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        scrollBottomConstraint.constant = 0
    }
    
}
