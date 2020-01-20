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
    let contactPreferrence = defaults.string(forKey: "Contact Preference"),
    let location =  defaults.string(forKey: "Location"),
    let base = defaults.string(forKey: "Base"),
    let pcsDate = defaults.string(forKey: "PCS Date"),
    let married = defaults.string(forKey: "Married"),
    let spouseName = defaults.string(forKey: "Spouse Name"),
    let spousePhone = defaults.string(forKey: "Spouse Phone"),
    let spouseEmail = defaults.string(forKey: "Spouse Email"),
    let kids = defaults.string(forKey: "Kids"),
    let pets = defaults.string(forKey: "Pets"),
    let buyRent = defaults.string(forKey: "Buy or Rent"),
    let housingType = defaults.string(forKey: "Housing Type"),
    let locationType = defaults.string(forKey: "Location Type"),
    let sqFeet = defaults.string(forKey: "Square Feet"),
    let bedrooms = defaults.string(forKey: "Bedrooms"),
    let bathrooms = defaults.string(forKey: "Bathrooms"),
    let flooring = defaults.string(forKey: "Flooring"),
    let garage = defaults.string(forKey: "Garage"),
    let pool = defaults.string(forKey: "Pool"),
    let yard = defaults.string(forKey: "Yard/Fence"),
    let interior = defaults.string(forKey: "Interior"),
    let purchasePrice = defaults.string(forKey: "Max Purchase Price"),
    let payment = defaults.string(forKey: "Desired Payment"),
    let downPayment = defaults.string(forKey: "Down Payment"),
    let loanType = defaults.string(forKey: "Loan Type"),
    let preApproved = defaults.string(forKey: "Pre-approved"),
    let bank = defaults.string(forKey: "Preffered Bank"),
    let firstTimeBuyer = defaults.string(forKey: "First Time Home Buyer"),
    let ownProperty = defaults.string(forKey: "Own Other Property"),
    let propertyPurpose = defaults.string(forKey:  "Property Purpose")
    else { return ["Error in getData"] }
    
    return [name, phone, email, service, request, contactPreferrence, location, base, pcsDate, married, spouseName, spousePhone, spouseEmail, kids, pets, buyRent, housingType, locationType, sqFeet, bedrooms, bathrooms, flooring, garage, pool, yard, interior, purchasePrice, payment, downPayment, loanType, preApproved, bank, firstTimeBuyer, ownProperty, propertyPurpose]
}
