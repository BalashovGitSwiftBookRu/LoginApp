//
//  ViewController.swift
//  LoginApp
//
//  Created by Sergey Balashov on 11/26/23.
//



import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - Data Storage
    let userName = "User"
    let password = "111"
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Main Function
    @IBAction func loginButtonAction() {
        if shouldPerformSegue(withIdentifier: "welcomeSegue", sender: self) {
            performSegue(withIdentifier: "welcomeSegue", sender: self)
        } else {
            showLoginAlert()
        }        
    }
    
    // MARK: - Input Data Validation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTextField.text == userName, passwordTextField.text == password else {
            return false
        }
        return true
    }
    
    // MARK: - Pass Data to the WelcomeVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as? WelcomeViewController
        welcomeVC?.userName = userNameTextField.text!
    }
    
    // MARK: - Alerts: Create & Call
    @IBAction func forgotUserNameAction() {
        showUserNameAlert()
    }
    
    @IBAction func forgotPasswordAction() {
        showPasswordAlert()
    }
    
    // Create alert for the Log In Button
    private func showLoginAlert() {
        let alertController = UIAlertController(title: "Invalid login or password", message: "Please, enter correct login and password", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { [self] _ in
            userNameTextField.text = ""
            passwordTextField.text = ""
        }
        
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    // Create alert for Forgot User Name Button.
    private func showUserNameAlert() {
        let alertController = UIAlertController(title: "Oops!", message: "User name is \(userName) 🙂", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    // Create alert for Forgot Password Button.
    private func showPasswordAlert() {
        let alertController = UIAlertController(title: "Oops!", message: "The password is \(password) 🙂", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    // MARK: - Hide keyboard.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: Return back from WelcomeVC
    @IBAction func unwindToLoginVC(_ unwindSegue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
}

