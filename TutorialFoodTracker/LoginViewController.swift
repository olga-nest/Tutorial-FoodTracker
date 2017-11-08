//
//  LoginViewController.swift
//  TutorialFoodTracker
//
//  Created by Olga on 11/6/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func loginButtonTapped(_ sender: UIButton) {

        WebService.shared.login(with: usernameField.text!, password: passwordField.text!, { success in
            if success {
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "toMealTableView", sender: nil)
                }
            } else {
                print("failed to login")
            }
        })
    }
}
