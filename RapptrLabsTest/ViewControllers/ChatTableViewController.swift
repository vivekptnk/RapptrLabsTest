//
//  ChatViewController.swift
//  RapptrLabsTest
//
//  Created by Vivek Pattanaik on 7/18/21.
//

import UIKit

class ChatTableViewController: UIViewController {
    // Cell ID
    let cellId = "ReusableCell"
    
     // table view where chat bubbles will be displayed.
    @IBOutlet var chatBoxTableView: UITableView!
    
    // Set up the messages data structure to capture the chat client data
    var messages : [MessageData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        // set background color of the tableview
        chatBoxTableView.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        
        // register the custom cell xib file (previously nib file)
        chatBoxTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        // remove separators
        chatBoxTableView.separatorStyle = .none
        chatBoxTableView.dataSource = self
        
        
        // call out chat client to fetch data from the
        ChatClient().getData { [weak self] (message) in
            self?.messages = message // initiate the messages data from the chat client
            
            DispatchQueue.main.async {
                self?.chatBoxTableView.reloadData() // reload the table to show it.
            }
        }
        
    }
    
    
    
}

extension ChatTableViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MessageCell

        
//         download image to display on the cell
        if let url = URL(string: messages?[indexPath.row].avatar_url ?? "Google.com") {
            URLSession.shared.dataTask(with: url) { [weak self] data , _ , error in
                if let data = data, error == nil {
                    // on the main thread
                    DispatchQueue.main.async {
                        cell.imageView?.image = UIImage(data: data)?.circleMask
                        self?.chatBoxTableView.reloadData()
                    }
                } else {
                    print("error data")
                }
            }.resume()
        }
        
        
        // give the cell data
        cell.userMessage.text = messages?[indexPath.row].message
        cell.userName.text = messages?[indexPath.row].name
        
        return cell
        
        
        
        
        
    }
}