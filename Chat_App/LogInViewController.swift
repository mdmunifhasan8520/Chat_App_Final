//
//  LogInViewController.swift
//  Chat_App
//
//  Created by MacBook Pro on 8/26/18.
//  Copyright © 2018 Code Drizzlers. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var loginSuccess: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func logInPressed(_ sender: AnyObject) {
        
        //SVProgressHUD.show()
        
        //TODO: Log in the user
        
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            
            if error != nil {
                print(error!)
                print("enter correct userName")
                //goToLogIn
                // self.performSegue(withIdentifier: "goToLogIn", sender: self)
                let alert = UIAlertController(title: "Sign In Failed",
                                              message: error?.localizedDescription,
                                              preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                
                self.present(alert, animated: true, completion: nil)
            } else {
                print("Log in successful")
                //SVProgressHUD.dismiss()
                //self.performSegue(withIdentifier: "goToChat", sender: self)
             
                    self.performSegue(withIdentifier: "goToChat", sender: nil)
                
            }
            print("button")
            
        }
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   
 
}
