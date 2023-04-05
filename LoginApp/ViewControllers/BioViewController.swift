//
//  BioViewController.swift
//  LoginApp
//
//  Created by Yelena Demchenko on 05.04.2023.
//

import UIKit

final class BioViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var biographyText: UITextView!
    
    // MARK: - Private properties
    
    private let biography = BioPerson.getBio()
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.applyGradientBackground()
        
        biographyText.text = biography.description
    }
}
