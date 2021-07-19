//
//  LoginClient.swift
//  RapptrLabsTest
//
//  Created by Vivek Pattanaik on 7/17/21.
//

import Foundation


/**
 URL : http://dev.rapptrlabs.com/Tests/scripts/login.php
 
 RESPONSE :
 
 {
    "code" : "Success",
    "message" : "Login Sucessful!"
    
 }
 
 */


// Login client to check if the entered credentials is valid.
class LoginClient {
    
    struct loginAuthResponseData : Decodable {
        let code : String
        let message : String
    }
    
    func loginAuth(email: String, passsword: String, completionBlock : @escaping (Bool) -> Void) -> Void  {
        // prepare the login url
        let url = URL(string: "http://dev.rapptrlabs.com/Tests/scripts/login.php")
        guard let requestUrl = url else {
            print("error with the link")
            return
        }
        
        // url request object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        // HTTP request params for the http request body
        let postString = "email=\(email)&password=\(passsword)"
        
        // set up the http request body
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        
        // return boolean value
        var dataValidatedBoolean = false
        
        
        // make the request
        let task  = URLSession.shared.dataTask(with: request) { data, _, error in
            
            // check if an error occured and data is valid
            guard let data = data, error == nil else {
                print("Error getting response data")
                return
            }
           
           // initiate result variable of type loginAuthResponseData
            var dataResponse : loginAuthResponseData?
            
            // decode data
            do {
                dataResponse = try JSONDecoder().decode(loginAuthResponseData.self, from: data)
               
            } catch {
                print("failed to deocde your login auth response data")
            }
            
            // make sure if we decoded any data
            guard dataResponse != nil else {return}
            
            dataValidatedBoolean = self.loginValidation(authResponse: dataResponse!)
            completionBlock(dataValidatedBoolean)

        }
        task.resume()
    }
    
    
    // check if the auth response recieved is valid
    private func loginValidation(authResponse : loginAuthResponseData) -> Bool {
        if authResponse.code == "Success" && authResponse.message == "Login Successful!" {
            return true
        } else {
            print(authResponse.code)
            print(authResponse.message)
            return false
        }
    }
    
}
