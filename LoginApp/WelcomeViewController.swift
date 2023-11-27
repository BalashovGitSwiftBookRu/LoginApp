//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Sergey Balashov on 11/26/23.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    var userName = ""
    
    @IBOutlet weak var userNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = "Welcome, \(userName)!"
    }
}
