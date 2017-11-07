//
//  User.swift
//  TutorialFoodTracker
//
//  Created by Olga on 11/6/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

import Foundation
import UICKeyChainStore

class User {
    typealias user = Constants.Keys.Network.User
    typealias keychain = Constants.Keys.Keychain
    
    //MARK: Properties
    var username = ""
    var password = ""
    
    //MARK: Helpers
    
    func parse(with json: [String: Any])
    {
        username = json[user.username] as! String
        password = json[user.password] as! String
        UICKeyChainStore.setString(json[user.token] as? String, forKey: keychain.token)
    }
}

