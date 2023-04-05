//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Yelena Demchenko on 31.03.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet var userNameWelcomeLabel: UILabel!
    
    @IBOutlet var greetingFromUser: UILabel!
    
    // MARK: - Public Properties
    
    var user: User!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let person = Person.getPerson()
        
        userNameWelcomeLabel.text = user.login + "!"
        greetingFromUser.text = "My name is \(person.name) \(person.surname)."
        
        view.applyGradientBackground()
    }
}

// MARK: - Extensions

extension UIView{
    
    func applyGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        
        let startColor = UIColor(
            red: 200/255,
            green: 127/255,
            blue: 144/255,
            alpha: 1).cgColor
        
        let endColor =  UIColor(
            red: 104/255,
            green: 125/255,
            blue: 181/255,
            alpha: 1).cgColor
        
        gradientLayer.colors = [startColor, endColor]
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
