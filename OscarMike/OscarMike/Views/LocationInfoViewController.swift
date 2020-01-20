//
//  LocationInfoViewController.swift
//  OscarMike
//
//  Created by Thomas Cowern New on 10/8/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class LocationInfoViewController: UIViewController, UITextFieldDelegate {
    
    // Outlets
    @IBOutlet weak var findSellRealtorLabel: UILabel!
    @IBOutlet weak var locationTextfield: UITextField!
    @IBOutlet weak var baseTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // Variables
    var findSellRealtor : String = "Test"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationTextfield.delegate = self
        baseTextField.delegate = self
        updateInfo()
    }
    
    // For pressing return on the keyboard to dismiss keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    // Methods
    func updateInfo () {
        print("LocationViewController: " + findSellRealtor)
        findSellRealtorLabel.text = findSellRealtor
    }
    
    // Actions
    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let location = locationTextfield.text,
              let base = baseTextField.text else { return }
        
        // Formatting date to string
        
        var stringDate = ""
        if ((datePicker?.date) != nil) {
            let date = datePicker.date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM-dd-yyyy"
            stringDate = dateFormatter.string(from: date)
        } else {
            print("No date selected")
        }
        
        saveInfo(userKey: Referral.location, userValue: location)
        saveInfo(userKey: Referral.base, userValue: base)
        saveInfo(userKey: Referral.pcsDate, userValue: stringDate)
    }
    
}
