//
//  LoginViewController.swift
//  RapptrLabsTest
//
//  Created by Vivek Pattanaik on 7/18/21.
//

import UIKit

class LoginViewController: UIViewController {

    // declare textfields and buttons
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light // changing UI style to Light mode
        
        // adding the padding to the left of the textFields
        emailTextField.setLeftPaddingPoints(24) // for email
        passwordTextField.setLeftPaddingPoints(24) // for password
    }
    
    // login button action
    @IBAction func loginPressed(_ sender: UIButton) {
        
    }
    

}
