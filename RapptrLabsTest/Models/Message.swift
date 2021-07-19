//
//  Message.swift
//  RapptrLabsTest
//
//  Created by Vivek Pattanaik on 7/17/21.
//

import Foundation

// outer json response
struct Response : Codable {
    let data : [MessageData]
}

// inner json response
struct MessageData : Codable {
    let user_id : String
    let name : String
    let avatar_url : String
    let message : String
}
