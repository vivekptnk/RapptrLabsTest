//
//  ChatMessageCell.swift
//  RapptrLabsTest
//
//  Created by Vivek Pattanaik on 7/20/21.
//

import UIKit

class ChatMessageCell: UITableViewCell {
    
    
    // declare the message cell attributes
    let userLabel = UILabel()
    let messageLabel = UILabel()
    let userImage = UIImage()
    let bubbleBackgroundView = UIView()
    
    
    // override the current style of the cells
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // FOR THE BACKGROUND
        bubbleBackgroundView.backgroundColor = UIColor(cgColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) // set up the color of the background
        messageLabel.translatesAutoresizingMaskIntoConstraints = false // Set this up for disabling auto resizing to adhere to the constraits we provide
        addSubview(bubbleBackgroundView) // add to the subview
        
        
        // FOR MESSAGES
        addSubview(messageLabel)
        messageLabel.numberOfLines = 0 // make the message auto resize
        messageLabel.translatesAutoresizingMaskIntoConstraints = false // Set this up for disabling auto resizing to adhere to the constraits we provide
        
        // set up constraints array for messageLabel and bubbleBackgroundView
        let constraints = [
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
//            messageLabel.widthAnchor.constraint(equalToConstant: 250),
            
//            bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: 0),
//            bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: 0),
//            bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 0),
//            bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 0)
            
        ]
        NSLayoutConstraint.activate(constraints) // activate constraints
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
