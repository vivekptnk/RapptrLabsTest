//
//  AnimationViewController.swift
//  RapptrLabsTest
//
//  Created by Vivek Pattanaik on 7/18/21.
//

import UIKit
import ConfettiView

class AnimationViewController: UIViewController {

    // Declare the image embedded view and fadeInButton
    @IBOutlet weak var rapptrLabsLogo: UIImageView!
    @IBOutlet weak var fadeInButton: UIButton!
    @IBOutlet weak var fadeOutButton: UIButton!
    @IBOutlet weak var confettiTimeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light // changing UI style to Light mode
        
        // stroke of the button
        confettiTimeButton.layer.cornerRadius = 8
        fadeOutButton.layer.borderWidth = 1
        fadeOutButton.layer.borderColor = #colorLiteral(red: 0.05490196078, green: 0.3607843137, blue: 0.537254902, alpha: 1)
        
        
    }
    
    @IBAction func confettiTimeButtonPressed(_ sender: UIButton) {
        
        rapptrLabsLogo.alpha = 0
        let confetti = ConfettiView() //
        self.view.addSubview(confetti)
        confetti.emit(with: [
            .text("🙍🏻‍♂️"),
            .text("📱"),
            .text("💻"),
            .text("🧑🏻‍💻"),
            .image(UIImage(named: "AppIcon")!, nil)
        ])
    }
    
    
    // fade in button action
    @IBAction func fadeInButtonPressed(_ sender: UIButton) {
        // add the image to a subview to conform to the extension of fadeIn animation check Extensions.swift for more
        self.view.addSubview(rapptrLabsLogo) // add subview
        rapptrLabsLogo.fadeIn() // simulate the fade in
        
    }
    
    @IBAction func fadeOutButtonPressed(_ sender: UIButton) {
        // add the image to a subview to conform to the extension of fadeOut animation check Extensions.swift for more.
        self.view.addSubview(rapptrLabsLogo) // add subview
        rapptrLabsLogo.fadeOut() // simulate the fade out 
    }
}
