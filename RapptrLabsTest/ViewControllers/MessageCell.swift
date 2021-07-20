//
//  MessageCell.swift
//  RapptrLabsTest
//
//  Created by Vivek Pattanaik on 7/20/21.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userMessage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // set message corner radius as 8px and border
        userMessage.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) // set the background color
        userMessage.layer.cornerRadius = 8 // set the corner radius
        userMessage.layer.masksToBounds = true // this will make sure that the corner radius bounds are all color of the layerBG
        userMessage.layer.borderWidth = 1
        userMessage.layer.borderColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1)
        
        // set image to circle
        userImage.layer.masksToBounds = true
        userImage.layer.cornerRadius = userImage.bounds.width / 2

    }

   
    
}
