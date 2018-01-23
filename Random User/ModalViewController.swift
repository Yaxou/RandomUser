//
//  ModalViewController.swift
//  Random User
//
//  Created by SUP'Internet 09 on 23/01/2018.
//  Copyright © 2018 SUP'Internet 09. All rights reserved.
//

import Foundation
import UIKit

class ModalViewController: UIViewController {
    var lastname: String?
    var firstname: String?
    var gender: String?
    var birthdate: String?
    var photo: String?
    
    @IBOutlet weak var lastnameB: UILabel!
    @IBOutlet weak var firstnameB: UILabel!
    @IBOutlet weak var birthdateB: UILabel!
    @IBOutlet weak var genderB: UILabel!
    @IBOutlet weak var photoB: UIImageView!
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lastnameB.text = lastname
        firstnameB.text = firstname
        birthdateB.text = birthdate
        genderB.text = gender
        
        let url = URL(string: photo!)
        let data = try? Data(contentsOf: url!)
        photoB.image = UIImage(data: data!)
        
    }
}
