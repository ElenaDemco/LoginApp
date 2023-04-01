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
    
    @IBOutlet var logOutButton: UIButton!
    
    private let gradientLayer = CAGradientLayer()
    
    var userName: String!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameWelcomeLabel.text = userName + "!"
        applyGradientBackground()
    }
    
    // MARK: - IB Action
    
    @IBAction func logOutButtonTapped() {
        view.endEditing(true)
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    
    private func applyGradientBackground() {
        gradientLayer.frame = view.bounds
        
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
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
