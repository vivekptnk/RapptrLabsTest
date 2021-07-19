//
//  HomeViewController.swift
//  RapptrLabsTest
//
//  Created by Vivek Pattanaik on 7/17/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    // Connections to storyboard buttons for chat, login and animation
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var animationButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting up the corner radius for buttons
        chatButton.layer.cornerRadius = 8
        loginButton.layer.cornerRadius = 8
        animationButton.layer.cornerRadius = 8
    }
    
    
    // Chat Button action
    @IBAction func chatButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToChat", sender: self) // segue to go to the ChatButtonController
    }
    
    // Login Button action
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToLogin", sender: self) // segue to go to the LoginViewController
    }
    
    // Animation Button action
    @IBAction func animationButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToAnimation", sender: self) // segue to go to the AnimationViewController
    }
}

