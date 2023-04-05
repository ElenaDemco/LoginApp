//
//  ProfileViewController.swift
//  LoginApp
//
//  Created by Yelena Demchenko on 05.04.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var profilePhoto: UIImageView!
    
    @IBOutlet var name: UILabel!
    @IBOutlet var surname: UILabel!
    @IBOutlet var age: UILabel!
    @IBOutlet var education: UILabel!
    @IBOutlet var maritalStatus: UILabel!
    
    // MARK: - Public Properties
    
    var user: User!
    
    // MARK: - Private properties
    
    private let person = Person.getPerson()
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.applyGradientBackground()
        
        name.text = "Name: \(person.name)"
        surname.text = "Surname: \(person.surname)"
        age.text = "Age: \(person.age)"
        education.text = "Education: \(person.education)"
        maritalStatus.text = "Marital status: \(person.maritalStatus.rawValue)"
    }
    
    override func viewDidLayoutSubviews() {
        profilePhoto.layer.cornerRadius = profilePhoto.frame.width / 2
    }
    
}


