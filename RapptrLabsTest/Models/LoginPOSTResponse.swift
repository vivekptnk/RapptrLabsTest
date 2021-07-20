//
//  LoginPOSTResponse.swift
//  RapptrLabsTest
//
//  Created by Vivek Pattanaik on 7/19/21.
//

import Foundation

struct loginAuthResponseData : Decodable {
    let code : String
    let message : String
}
