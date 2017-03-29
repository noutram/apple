//
//  ViewController.swift
//  socialapp
//
//  Created by Jack jones on 21/03/2017.
//  Copyright © 2017 Jack Jones. All rights reserved.
//

import UIKit
import Firebase


class ViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField:UITextField!
    
    var userUid: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    func goToCreatUserVC(){
        
        performSegue(withIdentifier: "SignUp", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignUp" {
            if let destination = segue.destination as? UserVC {
                if  userUid != nil {
                    destination.userUid = userUid
                }
                if emailField.text != nil {
                    destination.emailField = emailField.text
                }
                if passwordField.text != nil {
                    destination.passwordField = passwordField.text
                    
                }
                
            }
        }
    }
    @IBAction func signInTapped(_ sender:Any){
        if let email = emailField.text, let password = passwordField.text{
            FIRAuth.auth()?.signIn(withEmail: email, password: password,completion:
                { (user,error)in
                    if error == nil {
                        if let user = user {
                            self.userUid = user.uid
                            self.goToCreatUserVC()
                        }
                        
                    } else{
                        self.goToCreatUserVC()
                    }
            });
        }
    }
    
}
