//
//  ViewController.swift
//  Random User
//
//  Created by SUP'Internet 09 on 23/01/2018.
//  Copyright © 2018 SUP'Internet 09. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var GoButton: UIButton!
    
    @IBAction func clearCacheButton(_ sender: Any) {
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func CallAPI(_ sender: Any) {
        var manager = ApiManager()
        
        if(UserDefaults.standard.value(forKey: "firstname") != nil ){
            let cachedPerson = Person(
                firstname: UserDefaults.standard.value(forKey: "firstname") as! String,
                lastname: UserDefaults.standard.value(forKey: "lastname") as! String,
                gender: Person.Gender(rawValue: UserDefaults.standard.value(forKey: "gender") as! String)! ,
                email: "nil",
                birthdate: (UserDefaults.standard.value(forKey: "birthdate") as! String).toDate(format: "yyyy/MM/dd"),
                photo: UserDefaults.standard.value(forKey: "photo") as! String
            )
            self.performSegue(withIdentifier: "ShowModal", sender: cachedPerson)
        }else{
            manager.getRandomUserHydratedWithPerson(completion: { person in
                UserDefaults.standard.set(person.lastname,forKey: "lastname")
                UserDefaults.standard.set(person.firstname,forKey: "firstname")
                UserDefaults.standard.set(person.gender.rawValue,forKey: "gender")
                UserDefaults.standard.set(person.birthdate.toString(format: "yyyy/MM/dd"),forKey: "birthdate")
                UserDefaults.standard.set(person.photo, forKey: "photo")
                DispatchQueue.main.async {
                 self.performSegue(withIdentifier: "ShowModal", sender: person)   
                }
            })
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ShowModal"){
            let random = sender as! Person
            let controller = segue.destination as! ModalViewController
            controller.lastname = random.lastname
            controller.firstname = random.firstname
            controller.gender = random.gender.rawValue
            controller.birthdate = random.birthdate.toString(format: "yyyy-MM-dd")
            controller.photo = random.photo


            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

