//
//  ChatViewController.swift
//  RapptrLabsTest
//
//  Created by Vivek Pattanaik on 7/18/21.
//

import UIKit

class ChatViewController: UIViewController{
    
    
    @IBOutlet weak var chatBoxTableView: UITableView! // table view where chat bubbles will be displayed.
    var messages : [Message] = [
    Message(userID : "1",
            userName: "Drew",
            userText: "Team, can we give job applicants taking this test some examples of the types of apps they’d be working on if they joined our team?",
            userUrl: "http://dev.rapptrlabs.com/Tests/images/drew_avatar.png"),
    
    Message(userID: "2",
            userName: "Abby",
            userText:"We work on ecommerce apps for brands like PromGirl & Simply Dresses.",
            userUrl: "http://dev.rapptrlabs.com/Tests/images/abby_avatar.png"),
    
    Message(userID: "3",
            userName: "Taylor",
            userText: "You know those scooter sharing services that have been popping up? We developed and support one of those: Movo.",
            userUrl: "http://dev.rapptrlabs.com/Tests/images/taylor_avatar.png"),
    
    Message(userID: "2",
            userName: "Abby",
            userText: "We do a lot of hardware-pairing apps as well like Conair’s Smart WeightWatchers Scale and Phlex’s new smart goggles.",
            userUrl: "http://dev.rapptrlabs.com/Tests/images/abby_avatar.png")
]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ChatClient().getData()
        
    }
    
    
}
