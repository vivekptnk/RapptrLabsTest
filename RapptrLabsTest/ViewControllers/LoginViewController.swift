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
        
        
        // make sure the email and password textfields exist
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            // display error to show that the textfields are empty
            return
        }
        
        // create an alert if textfields are empty
        if email  == "" || password == "" {
            showEmptyFieldsAlert()
        }
        
        // record the start time for API Call beginning
        let startTime = Date()
        
        // authenticate the credentials entered
        LoginClient().loginAuth(email: email, passsword: password) { boolean in
            // if the API validated the call
            if boolean == true {
                let execTime = self.getExecutionTime(startTime: startTime)
                self.showSucessAlert(executionTime: execTime)
            } else { // if API call was rejected
                self.showErrorAlert()
            }
            
        }
    }
    
    
    // function to get executiontime
    func getExecutionTime(startTime : Date) -> Double {
        
        // check exectutoin time from the startTime of APICall
        let executionTime = Date().timeIntervalSince(startTime)
        let apiCallExecTime = executionTime*1000
        return apiCallExecTime
    }
    
    
    // function to show alert
    func showSucessAlert(executionTime : Double) {
        
        // show alert on the main thread asynchronously
        DispatchQueue.main.async {
            // set up a sucess alert
            let alert = UIAlertController(title: "Success", message: "Login Successful! Time taken to execute this API Call was \(executionTime) milliseconds.", preferredStyle: .alert)
            
            // add the ok action button
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                
                // pop the current view controller from the viewcontrollers stack.
                self.navigationController?.popViewController(animated: true)
                
            }))
            
            // show the alert
            self.present(alert, animated: true)
        }
    }
    
    func showEmptyFieldsAlert() {
        DispatchQueue.main.async {
            
            // Add alert for missing email 
            let alert = UIAlertController(title: "Error", message: "Missing Email or Password!", preferredStyle: .alert)
            
            // add the ok action button
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            // show the alert
            self.present(alert,animated: true)
        }
    }
    
    func showErrorAlert() {
        DispatchQueue.main.async {
            // Add alert for error
            let alert = UIAlertController(title: "Error", message: "Incorrect Email or Password!", preferredStyle: .alert)
            
            // add the ok action button
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil
            ))
            
            // show the alert
            self.present(alert, animated: true)
        }
    }
}
