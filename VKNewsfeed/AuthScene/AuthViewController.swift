//
//  ViewController.swift
//  VKNewsfeed
//
//  Created by Ростислав Ермаченков on 28.11.2020.
//

import UIKit

class AuthViewController: UIViewController {

    private var authService: AuthService!
    
    @IBAction func signInTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authService = SceneDelegate.shared().authService
    }


}

