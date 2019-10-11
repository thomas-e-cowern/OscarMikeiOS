//
//  PersonalInfoViewController.swift
//  OscarMike
//
//  Created by Thomas Cowern New on 10/8/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class PersonalInfoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
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
        
        // Pickerview Setup
        militaryServicePicker.isHidden = true
        contactPreferencePicker.isHidden = true
        
    }
    
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
