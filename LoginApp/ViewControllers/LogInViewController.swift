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
    
    // MARK: - Private properties
    
    private let user = User.getUserData()
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 8
        
        userNameTF.text = user.login
        passwordTF.text = user.password
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTabBarController" {
            let tabBarController = segue.destination as? UITabBarController
            let welcomeVC = tabBarController?.viewControllers?.first as? WelcomeViewController
            let profileVC = tabBarController?.viewControllers?.last as? ProfileViewController
            
            welcomeVC?.user = user
            profileVC?.user = user
        }
    }
    
    // MARK: - IB Actions
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = user.login
        passwordTF.text = user.password
    }
    
    @IBAction func logInButtonTapped() {
        
        guard userNameTF.text == user.login && passwordTF.text == user.password else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTF
            )
            return
        }
        performSegue(withIdentifier: "showTabBarController", sender: nil)
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Hint", message: "Your name is \(user.login).")
        : showAlert(title: "Hint", message: "Your password is \(user.password).")
    }
    
    // MARK: - Private Methods
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
