//
//  Constants.swift
//  TutorialFoodTracker
//
//  Created by Olga on 11/6/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

import Foundation

struct Constants
{
    struct SeugueIdentifiers {
        //TODO: Add other segues identifiers
        static let signup = "toSignupScreen"
        static let addItem = "AddItem"
        static let showDetail = "ShowDetail"
        static let login = "toLoginScreen"
    }
    
    struct Keys {
        struct Keychain {
            static let token = "token"
        }
        struct Network {
            struct User {
                static let user = "user"
                static let username = "username"
                static let password = "password"
                static let token = "token"
            }
        }
    }
}
