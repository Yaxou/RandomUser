//
//  exercice_5.swift
//  exercice
//
//  Created by SUP'Internet 01 on 16/01/2018.
//  Copyright © 2018 SUP'Internet 01. All rights reserved.
//

import Foundation

extension ApiManager {
    
    func getRandomUserHydratedWithPerson(completion: @escaping (Person) -> Void) {
        
        self.getRandomUser(completion: { data in
            
            let result = data as! [String:Any]
            
            let name = result["name"] as! [String: String]
            let picture = result["picture"] as! [String: String]
            
            if let firstname = name["first"], let lastname = name["last"], let email = result["email"], let gender = result["gender"], let birthdate = result["dob"], let photo = picture["large"] {
                
                let person = Person(
                    firstname: firstname,
                    lastname: lastname,
                    gender: Person.Gender(rawValue: gender as! String)!,
                    email: email as! String,
                    birthdate: (date: birthdate as! String, format: "yyyy-MM-dd HH:mm:ss"),
                    photo: photo
                )
                
                completion(person)
                
            }
            
        })
        
    }
    
}
