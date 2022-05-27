//
//  LoginViewController.swift
//  ESS
//
//  Created by wido technologies on 27/05/22.
//

import Foundation
import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        

        if UserDefaults.standard.string(forKey: "username") != nil
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let mainViewController = storyboard.instantiateViewController(identifier: "MainNavID")
            
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainViewController)
            
            
            self.navigationController?.pushViewController(mainViewController, animated: true)
            
            
            
        }
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text
         {
             Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                 if let e = error {
                     print(e)
                 }
                 else {
                     let storyboard = UIStoryboard(name: "Main", bundle: nil)
                     
                     let mainViewController = storyboard.instantiateViewController(identifier: "MainNavID")
                     
                     self.navigationController?.pushViewController(mainViewController, animated: true)
                    
                 }

                   
                        }
                 }
             }
    }
    
