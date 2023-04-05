//
//  BioViewController.swift
//  LoginApp
//
//  Created by Yelena Demchenko on 05.04.2023.
//

import UIKit

final class BioViewController: UIViewController {

    
    @IBOutlet var biographyText: UITextView!
    
    private let biography = BioPerson.getBio()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.applyGradientBackground()
        
        biographyText.text = biography.description
    }
}
