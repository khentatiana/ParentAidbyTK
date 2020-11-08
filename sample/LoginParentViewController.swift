//
//  LoginParentViewController.swift
//  sample
//
//  Created by Tatiana on 11/6/20.
//

import UIKit
import Parse

class LoginParentViewController: UIViewController {

    @IBOutlet weak var usernameParentField: UITextField!
    
    @IBOutlet weak var passwordParentField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onParentSignIn(_ sender: Any) {
        let username = usernameParentField.text!
        let password = passwordParentField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginParentSegue", sender: nil)
            }
            else {
                print ("Error: \(error?.localizedDescription)")
            }
        }
        
    }
    
    @IBAction func onParentSignUp(_ sender: Any) {
        var user = PFUser(className: "_User")
        user.username = usernameParentField.text
        user.password = passwordParentField.text
        
        user.signUpInBackground{ (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginParentSegue", sender: nil)
            } else {
                print ("Error: \(error?.localizedDescription)")
            }
        



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
}
