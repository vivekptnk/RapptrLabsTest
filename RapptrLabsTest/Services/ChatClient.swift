//
//  ChatClient.swift
//  RapptrLabsTest
//
//  Created by Vivek Pattanaik on 7/17/21.
//

import Foundation

/// JSON Details
/**
 URL : "https://dev.rapptrlabs.com/Tests/scripts/chat_log.php"
 RESPONSE :
 {
 "data":[
 {
 "user_id":"1",
 "name":"Drew",
 "avatar_url":"http://dev.rapptrlabs.com/Tests/images/drew_avatar.png",
 "message":"Team, can we give job applicants taking this test some examples of the types of apps they’d be working on if they joined our team?"
 },
 {
 "user_id":"2",
 "name":"Abby",
 "avatar_url":"http://dev.rapptrlabs.com/Tests/images/abby_avatar.png",
 "message":"We work on ecommerce apps for brands like PromGirl & Simply Dresses."
 },
 {
 "user_id":"3",
 "name":"Taylor",
 "avatar_url":"http://dev.rapptrlabs.com/Tests/images/taylor_avatar.png",
 "message":"You know those scooter sharing services that have been popping up? We developed and support one of those: Movo."
 },
 {
 "user_id":"2",
 "name":"Abby",
 "avatar_url":"http://dev.rapptrlabs.com/Tests/images/abby_avatar.png",
 "message":"We do a lot of hardware-pairing apps as well like Conair’s Smart WeightWatchers Scale and Phlex’s new smart goggles."
 }
 ]
 }
 
 */

/// Chat Client to fetch data from given JSON link
class ChatClient {
    
    func getData(completionBlock : @escaping ([MessageData]) -> Void) -> Void {
        
        // URL Link
        let url = "https://dev.rapptrlabs.com/Tests/scripts/chat_log.php"
        
        // get data using the URL session
        let urlSession = URLSession.shared.dataTask(with: URL(string: url)!) { data , reponse , error  in
            // makre sure if data is there and error doesnt exist.
            guard let data = data, error == nil else {
                print("Error fetching Data.")
                return
            }
            
            // initate result variable of type response
            var results : Response?
            
            // decode data using JSONDecoder
            do {
                results = try JSONDecoder().decode(Response.self, from: data)
            } catch {
                print("failed to decode your already fetched data.")
            }
            
            // make sure if we recieved any data.
            guard let json = results else {return}
            completionBlock(json.data)
        }
        
        func downloadImageData(url : String, completion : @escaping () -> Void) -> Void {
            
        }
        
        // trigger the operation.
        urlSession.resume()
    }
    
    
}
