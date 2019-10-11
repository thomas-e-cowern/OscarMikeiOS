//
//  ReferralModel.swift
//  OscarMike
//
//  Created by Thomas Cowern New on 10/11/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class Referral {
    
    // Properties
    var name : String
    var service : String
    var phone : String
    var email : String
    var contactPreference: String
    var married : Bool
    var kids : Bool
    var pets : Bool
    var location: String
    var base : String
    
    init(name: String, service: String, phone: String, email: String, contactPreference: String, married: Bool, kids : Bool, pets : Bool, location: String, base : String) {
        self.name = name
        self.service = service
        self.phone = phone
        self.email = email
        self .contactPreference = contactPreference
        self.married = married
        self.kids = kids
        self.pets = pets
        self.location = location
        self.base = base
    }
    
    
}
