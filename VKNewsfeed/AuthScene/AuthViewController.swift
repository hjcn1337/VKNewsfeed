//
//  ViewController.swift
//  VKNewsfeed
//
//  Created by Ростислав Ермаченков on 28.11.2020.
//

import UIKit

class AuthViewController: UIViewController {

    private var authService: AuthService!
    
    private var circleProgressView: CircleProgressView!
    private var authorizeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authService = SceneDelegate.shared().authService
        
        circleProgressView = CircleProgressView(frame: CGRect(x: 160, y: 150, width: 220, height: 220))
        circleProgressView.center = view.center
        circleProgressView.backgroundColor = .white
        view.addSubview(circleProgressView)
        
        authorizeButton = UIButton(type: .custom)
        authorizeButton.frame = CGRect(x: 160, y: 150, width: 200, height: 200)
        authorizeButton.backgroundColor = #colorLiteral(red: 0.9253895879, green: 0.9255481362, blue: 0.9253795743, alpha: 1)
        authorizeButton.layer.cornerRadius = 0.5 * authorizeButton.bounds.size.width
        authorizeButton.clipsToBounds = true
        authorizeButton.setTitle("Войти в VK", for: .normal)
        authorizeButton.titleLabel?.font = .boldSystemFont(ofSize: 24)
        authorizeButton.setTitleColor(#colorLiteral(red: 0, green: 0.462745098, blue: 1, alpha: 1), for: .normal)
        authorizeButton.addTarget(self, action: #selector(authorizeVK), for: .touchDown)
        authorizeButton.addTarget(self, action: #selector(setCircleProgressAtZero), for: .touchUpInside)
        authorizeButton.center = view.center
        
        view.addSubview(authorizeButton)
        
    }
    
    @objc func authorizeVK() {
        authorizeButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.circleProgressView?.setProgress(newProgress: 1.0, animated: true) {
            self.authService.wakeUpSession()
        }
    }
    
    @objc func setCircleProgressAtZero() {
        authorizeButton.backgroundColor = #colorLiteral(red: 0.9253895879, green: 0.9255481362, blue: 0.9253795743, alpha: 1)
        self.circleProgressView?.setProgress(newProgress: 0.0, animated: true)
    }
}

