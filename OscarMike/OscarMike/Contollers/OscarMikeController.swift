//
//  OscarMikeController.swift
//  OscarMike
//
//  Created by Thomas Cowern New on 10/21/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

var defaults = UserDefaults.standard

func saveInfo (userKey: String, userValue: String) {
    defaults.set(userValue, forKey: userKey)
}

func getData () -> [String] {
    guard let name = defaults.string(forKey: "Name"),
    let phone = defaults.string(forKey: "Phone"),
    let email = defaults.string(forKey: "Email"),
    let service = defaults.string(forKey: "Service"),
    let request = defaults.string(forKey: "Request"),
    let location =  defaults.string(forKey: "Location"),
    let base = defaults.string(forKey: "Base"),
    let married = defaults.string(forKey: "Married"),
    let kids = defaults.string(forKey: "Kids"),
    let pets = defaults.string(forKey: "Pets")
    else { return ["Error in getData"] }
    
    return [name, phone, email, service, request, location, base, married, kids, pets]
}
