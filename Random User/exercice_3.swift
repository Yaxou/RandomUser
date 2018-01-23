//
//  exercice_3.swift
//  Exo1
//
//  Created by SUP'Internet 09 on 09/01/2018.
//  Copyright © 2018 SUP'Internet 09. All rights reserved.
//


import Foundation

extension String {
    
    func toDate(format: String) -> Date {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = format
        
        if let date = dateFormatter.date(from: self) {
            return date
        }
        
        return Date()
        
    }
    
}

extension Date {
    
    func toString(format: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
        
    }
    
    func getYearDifferenceFrom(date: Date) -> Int {
        
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: self, to: date)
        
        return ageComponents.year!
        
    }
    
}

struct Email: CustomStringConvertible {
    
    let email: String?
    
    init(str: String) {
        self.email = str
    }
    
    var description: String {
        return "\(self.email!)"
    }
    
    func isValid() -> Bool {
        
        if (true) {
            return true
        } else {
            return false
        }
        
    }
    
}

class Existence: CustomStringConvertible  {
    
    var birthdate: Date
    var age: Int
    
    init(birthdate: Date?) {
        
        if birthdate != nil {
            self.birthdate = birthdate!
        } else {
            self.birthdate = Date()
        }
        
        self.age = self.birthdate.getYearDifferenceFrom(date: Date())
        
    }
    
    var description: String {
        return self.birthdate.toString(format: "yyyy-MM-dd")
    }
    
    func willProbablyDieSoon() -> Bool {
        return self.age > 100
    }
    
}

class Person: Existence {
    
    
    enum Gender: String {
        case Male = "male"
        case Female = "female"
        case Other = "other"
    }
    
    var gender: Gender
    var firstname: String
    var lastname: String
    var email: Email
    var photo: String
    
    init(firstname: String, lastname: String, gender: Gender, email: String, birthdate: (date: String, format: String), photo: String) {
        
        self.gender = gender
        self.firstname = firstname
        self.lastname = lastname
        self.email = Email(str: email)
        self.photo = photo
        
        
        super.init(birthdate: birthdate.date.toDate(format: birthdate.format))
    }
    
    init(firstname: String, lastname: String, gender: Gender, email: String, birthdate: Date, photo: String) {
        
        self.gender = gender
        self.firstname = firstname
        self.lastname = lastname
        self.email = Email(str: email)
        self.photo = photo
        
        super.init(birthdate: birthdate)
        
    }
    
    func show() {
        
        print("firstname : \(self.firstname) ")
        print("lastname : \(self.lastname) ")
        
        switch self.gender {
        case .Male:
            print("gender : Male")
        case .Female:
            print("gender : Female")
        case .Other:
            print("gender : Other")
        }
        
        print("email valid : \(self.email.isValid())")
        print("email : \(self.email)")
        
        print("birthdate : \(self.birthdate)")
        print("age : \(self.age)")
        print("will die soon : \(self.willProbablyDieSoon())")
        
    }
    
}
