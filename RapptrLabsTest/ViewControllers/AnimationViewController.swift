//
//  AnimationViewController.swift
//  RapptrLabsTest
//
//  Created by Vivek Pattanaik on 7/18/21.
//

import UIKit

class AnimationViewController: UIViewController {
    
    // Declare the image embedded view and fadeInButton
    @IBOutlet weak var rapptrLabsLogo: UIImageView!
    @IBOutlet weak var fadeInButton: UIButton!
    @IBOutlet weak var fadeOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light // changing UI style to Light mode
        
        // stroke of the button
        fadeOutButton.layer.borderWidth = 1
        fadeOutButton.layer.borderColor = #colorLiteral(red: 0.05490196078, green: 0.3607843137, blue: 0.537254902, alpha: 1)
        
        // setting initial opacity of the logo to be zero
        rapptrLabsLogo.alpha = 0
        
    }
    
    // fade in button action
    @IBAction func fadeInButtonPressed(_ sender: UIButton) {
        
        // add the image to a subview to conform to the extension of fadeIn animation check Extensions.swift for more.
        rapptrLabsLogo.alpha = 0 // for demonstration purposes 
        self.view.addSubview(rapptrLabsLogo)
        rapptrLabsLogo.fadeIn()
        
    }
    
    @IBAction func fadeOutButtonPressed(_ sender: UIButton) {
        // add the image to a subview to conform to the extension of fadeOut animation check Extensions.swift for more.
        rapptrLabsLogo.alpha = 1
        self.view.addSubview(rapptrLabsLogo)
        rapptrLabsLogo.fadeOut()
    }
}
