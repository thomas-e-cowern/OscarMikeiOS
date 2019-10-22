//
//  PersonalInfoViewController.swift
//  OscarMike
//
//  Created by Thomas Cowern New on 10/8/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation
import UIKit

class PersonalInfoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    // Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var militaryServicePicker: UIPickerView!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var contactPreferencePicker: UIPickerView!
    @IBOutlet weak var militaryServiceButton: UIButton!
    @IBOutlet weak var contactPreferenceButton: UIButton!
    @IBOutlet weak var marriedButton: UIButton!
    @IBOutlet weak var kidsButton: UIButton!
    @IBOutlet weak var petsButton: UIButton!
    
    // Variables
    let militaryBranch : [String] = ["", "Army", "Navy", "Air Force", "Marines", "Coast Guard"]
    let communicationPreference : [String] = ["", "Texting", "Email", "Phone"]
    var branch : String = ""
    var commPref : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Delegates
        militaryServicePicker.delegate = self
        contactPreferencePicker.delegate = self
        nameTextField.delegate = self
        phoneTextField.delegate = self
        emailTextField.delegate = self
        
        // Pickerview Setup
        militaryServicePicker.isHidden = true
        contactPreferencePicker.isHidden = true
        
        // Set up tapping on screen hides keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    // For pressing return on the keyboard to dismiss keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    
    // Pickerview
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView {
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case militaryServicePicker:
            return militaryBranch.count
        case contactPreferencePicker:
            return communicationPreference.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case militaryServicePicker:
            return militaryBranch[row]
        case contactPreferencePicker:
            return communicationPreference[row]
        default:
            return "Error in pickerView"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case militaryServicePicker:
            branch = militaryBranch[row]
            militaryServicePicker.isHidden = true
            militaryServiceButton.setTitle(branch, for: .normal)
        case contactPreferencePicker:
            commPref = communicationPreference[row]
            contactPreferencePicker.isHidden = true
            contactPreferenceButton.setTitle(commPref, for: .normal)
        default:
            break
        }
    }

    // Actions
    @IBAction func militaryServiceButtonPressed(_ sender: Any) {
        militaryServicePicker.isHidden = false
        
    }
    
    
    @IBAction func communicationPreferencePressed(_ sender: Any) {
        contactPreferencePicker.isHidden = false
    }
    
    @IBAction func marriedButtonPressed(_ sender: Any) {
        if marriedButton.titleLabel?.text == "No" {
            marriedButton.setTitle("Yes", for: .normal)
        } else {
            marriedButton.setTitle("No", for: .normal)
        }
    }
    
    @IBAction func kidsButtonPressed(_ sender: Any) {
        if kidsButton.titleLabel?.text == "No" {
            kidsButton.setTitle("Yes", for: .normal)
        } else {
            kidsButton.setTitle("No", for: .normal)
        }
    }
    
    @IBAction func petsButtonPressed(_ sender: Any) {
        if petsButton.titleLabel?.text == "No" {
            petsButton.setTitle("Yes", for: .normal)
        } else {
            petsButton.setTitle("No", for: .normal)
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        guard let name = nameTextField.text else {return}
        guard let phone = phoneTextField.text else {return}
        guard let email = emailTextField.text else {return}
        guard let service = militaryServiceButton.titleLabel?.text else {return}
        guard let preference = contactPreferenceButton.titleLabel?.text else {return}
        guard let married = marriedButton.titleLabel?.text else { return }
        guard let kids = kidsButton.titleLabel?.text else { return }
        guard let pets = petsButton.titleLabel?.text else { return }
        
        print("name: \(name) \nphone: \(phone) \nemail: \(email) \nservice: \(service)")
        
        saveInfo(userKey: Referral.name, userValue: name)
        saveInfo(userKey: Referral.phone, userValue: phone)
        saveInfo(userKey: Referral.email, userValue: email)
        saveInfo(userKey: Referral.service, userValue: service)
        saveInfo(userKey: Referral.contactPreference, userValue: preference)
        saveInfo(userKey: Referral.married, userValue: married)
        saveInfo(userKey: Referral.kids, userValue: kids)
        saveInfo(userKey: Referral.pets, userValue: pets)
    }
}
