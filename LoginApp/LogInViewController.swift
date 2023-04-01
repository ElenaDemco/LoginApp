//
//  ViewController.swift
//  LoginApp
//
//  Created by Yelena Demchenko on 31.03.2023.
//

import UIKit

final class LogInViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    
    @IBOutlet var forgotUserNameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 8
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(
        for segue: UIStoryboardSegue, sender: Any?) {
            guard let welcomeVC = segue.destination as? WelcomeViewController else {
                return
            }
            welcomeVC.userName = userNameTF.text
        }
    
    // MARK: - IB Actions
    
    @IBAction func unwindToLogInScreen(segue: UIStoryboardSegue) {
        guard let _ = segue.source as? WelcomeViewController else { return }
        userNameTF.text = ""
        passwordTF.text = ""
        view.endEditing(true)
    }
    
    @IBAction func logInButtonTapped() {
        
        let userName = userNameTF.text
        let password = passwordTF.text
        
        if userName == "Alexey" && password == "111" {
            _ = WelcomeViewController()
        } else {
            showAlert(
                withTitle: "Invalid login or password",
                andMessage: "Please, enter correct login and password"
            )
        }
    }
    
    @IBAction func forgotUserNameButtonTapped() {
        showAlert(withTitle: "Hint", andMessage: "Your name is Alexey")
    }
    
    @IBAction func forgotPasswordButtonTapped() {
        showAlert(withTitle: "Hint", andMessage: "Your password is 111")
    }
    
    // MARK: - Private Methods
    private func showAlert(withTitle title: String, andMessage message: String) {
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
