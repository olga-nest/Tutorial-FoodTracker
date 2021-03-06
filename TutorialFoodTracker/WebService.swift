//
//  WebService.swift
//  TutorialFoodTracker
//
//  Created by Olga on 11/6/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

import Foundation
import UIKit
import UICKeyChainStore

class WebService {
    
    //MARK: Properties
    static let shared = WebService()
    
    // MARK: - Networking
    func signUp(with email: String, password: String, and presentingViewController: UIViewController) {
        
        let postData = [
        "username": email,
        "password": password ]

        guard let postJSON = try? JSONSerialization.data(withJSONObject: postData, options: []) else {
            print("could not serialize json")
            return
        }
        let url = URL(string: "https://cloud-tracker.herokuapp.com/signup")!
        let request = NSMutableURLRequest(url: url)
        request.httpBody = postJSON
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            guard let data = data else {
                print("no data returned from server \(String(describing: error?.localizedDescription))")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("no response returned from server \(String(describing: error))")
                return
            }
            
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String:Any] else {
                print("data returned is not json, or not valid")
                return
            }
            
            let user = User()
            user.parse(with: json)
            
            presentingViewController.dismiss(animated: true, completion: nil)
            
            guard response.statusCode == 200 else {
                // handle error
                print("an error occurred \(String(describing: json["error"]))")
                return
            }
          
            }
        // do something with the json object
        task.resume()
    }
    
    func login(with email: String, password: String, _ completionHandler: @escaping (Bool) -> Void)
    {
        let postData = [
            "username": email,
            "password": password ]
        
        guard let postJSON = try? JSONSerialization.data(withJSONObject: postData, options: []) else {
            print("could not serialize json")
            completionHandler(false)
            return
        }
        
        let url = URL(string: "https://cloud-tracker.herokuapp.com/login")!
        let request = NSMutableURLRequest(url: url)
        request.httpBody = postJSON
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            guard let data = data else {
                print("no data returned from server \(String(describing: error?.localizedDescription))")
                completionHandler(false)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("no response returned from server \(String(describing: error))")
                completionHandler(false)
                return
            }
            
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String:Any] else {
                print("data returned is not json, or not valid")
                completionHandler(false)
                return
            }
            
            guard response.statusCode == 200 else {
                // handle error
                //TODO: notify user
                print("an error occurred \(String(describing: json["error"]))")
                completionHandler(false)
                return
            }
            
            if let value = json[Constants.Keys.Network.User.token] as? String {
                guard
                    UICKeyChainStore.setString(value, forKey: Constants.Keys.Keychain.token) == true
                    else {
                        print("Could not save to keychain store.")
                        completionHandler(false)
                        return
                }
                
                completionHandler(true)
                return
            } else {
                print("No value for key \(Constants.Keys.Keychain.token)")
                completionHandler(false)
                return
            }
        }
        
        task.resume()
    }
}


