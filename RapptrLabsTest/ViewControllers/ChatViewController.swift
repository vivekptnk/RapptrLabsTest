//
//  ChatViewController.swift
//  RapptrLabsTest
//
//  Created by Vivek Pattanaik on 7/18/21.
//

import UIKit

class ChatViewController: UIViewController{
    
    
    @IBOutlet weak var chatBoxTableView: UITableView! // table view where chat bubbles will be displayed.
    var messages : [MessageData] = [
    MessageData(user_id : "1",
                name: "Drew",
                avatar_url: "http://dev.rapptrlabs.com/Tests/images/drew_avatar.png",
                message: "Team, can we give job applicants taking this test some examples of the types of apps they’d be working on if they joined our team?"),
    
    MessageData(user_id: "2",
                name: "Abby",
                avatar_url:"We work on ecommerce apps for brands like PromGirl & Simply Dresses.",
                message: "http://dev.rapptrlabs.com/Tests/images/abby_avatar.png"),
    
    MessageData(user_id: "3",
                name: "Taylor",
                avatar_url: "http://dev.rapptrlabs.com/Tests/images/taylor_avatar.png",
                message: "You know those scooter sharing services that have been popping up? We developed and support one of those: Movo."),
    
    MessageData(user_id: "2",
                name: "Abby",
                avatar_url: "http://dev.rapptrlabs.com/Tests/images/abby_avatar.png",
                message: "We do a lot of hardware-pairing apps as well like Conair’s Smart WeightWatchers Scale and Phlex’s new smart goggles.")
]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ChatClient().getData { message in
            print(message)
        }
        
    }
    
    
}
