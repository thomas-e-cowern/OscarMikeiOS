//
//  HomeInfoViewController.swift
//  OscarMike
//
//  Created by Thomas Cowern New on 10/9/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class HomeInfoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Outlets
    @IBOutlet weak var housingTypeButton: UIButton!
    @IBOutlet weak var housingTypePicker: UIPickerView!
    @IBOutlet weak var housingLocationButton: UIButton!
    @IBOutlet weak var housingLocationPicker: UIPickerView!
    @IBOutlet weak var bedroomsButton: UIButton!
    @IBOutlet weak var bedroomsPicker: UIPickerView!
    @IBOutlet weak var bathroomsButton: UIButton!
    @IBOutlet weak var bathroomsPicker: UIPickerView!
    @IBOutlet weak var flooringPreferenceButton: UIButton!
    @IBOutlet weak var flooringPreferencePicker: UIPickerView!
    @IBOutlet weak var garageButton: UIButton!
    @IBOutlet weak var poolButton: UIButton!
    @IBOutlet weak var yardFenceButton: UIButton!
    @IBOutlet weak var interiorButton: UIButton!
    
    // Variables
    var buy_rent_data: [String] = [String]()
    var house_type_data: [String] = [String]()
    var location_data: [String] = [String]()
    var bedrooms_data: [Int] = [Int]()
    var bathrooms_data: [Int] = [Int]()
    var flooring_data: [String] = [String]()
    var buy_rent_value: String = ""
    var house_type_value: String = ""
    var pcs_date_string: String = ""
    var location_value: String = ""
    var bedrooms_value: Int = 0
    var bathrooms_value: Int = 0
    var flooring_value: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegate
        housingTypePicker.delegate = self
        housingLocationPicker.delegate = self
        bedroomsPicker.delegate = self
        bathroomsPicker.delegate = self
        flooringPreferencePicker.delegate = self

        // Data
        buy_rent_data = ["", "Buy", "Rent", "Buy or Rent"]
        house_type_data = ["", "House", "Condo", "Apartment"]
        location_data = ["", "Urban", "Suburban", "Rural"]
        bedrooms_data = [0, 1, 2, 3, 4, 5, 6]
        bathrooms_data = [0, 1, 2, 3, 4]
        flooring_data = ["", "Carpet", "Tile", "Wood", "Linoleum"]
        
        // Picker set up
        housingTypePicker.isHidden = true
        housingLocationPicker.isHidden = true
        bedroomsPicker.isHidden = true
        bathroomsPicker.isHidden = true
        flooringPreferencePicker.isHidden = true
    }
    
    // Actions
    @IBAction func housingTypeButtonPressed(_ sender: Any) {
        housingTypePicker.isHidden = false
    }
    
    @IBAction func locationButtonPressed(_ sender: Any) {
        housingLocationPicker.isHidden = false
    }
    
    @IBAction func bedroomsButtnPressed(_ sender: Any) {
        bedroomsPicker.isHidden = false
    }
    
    @IBAction func bathroomsButtonPressed(_ sender: Any) {
        bathroomsPicker.isHidden = false
    }
    
    @IBAction func flooringPreferenceButtonPressed(_ sender: Any) {
        flooringPreferencePicker.isHidden = false
    }
    
    @IBAction func garageButtonPressed(_ sender: Any) {
        guard let status = garageButton.titleLabel?.text else { return }
        
           if status == "No" {
               garageButton.setTitle("Yes", for: .normal)
           } else {
               garageButton.setTitle("No", for: .normal)
           }
    }
    
    @IBAction func yardFenceButtonPressed(_ sender: Any) {
    }
    
    @IBAction func poolButtonPressed(_ sender: Any) {
    }
    
    @IBAction func interiorPrefButtonPressed(_ sender: Any) {
    }
    
    // Pickerview
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView {
        case housingTypePicker:
            return 1
        case housingLocationPicker:
            return 1
        case bedroomsPicker:
            return 1
        case bathroomsPicker:
            return 1
        case flooringPreferencePicker:
            return 1
        default:
            return 0
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case housingTypePicker:
            return house_type_data.count
        case housingLocationPicker:
            return location_data.count
        case bedroomsPicker:
            return bedrooms_data.count
        case bathroomsPicker:
            return bathrooms_data.count
        case flooringPreferencePicker:
            return flooring_data.count
        default:
            return 0
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case housingTypePicker:
            return house_type_data[row]
        case housingLocationPicker:
            return location_data[row]
        case bedroomsPicker:
            return "\(bedrooms_data[row])"
        case bathroomsPicker:
            return "\(bathrooms_data[row])"
        case flooringPreferencePicker:
            return flooring_data[row]
        default:
            return ""
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 25
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        // Get the value, set button title, and hide the picker
        switch pickerView {
        case housingTypePicker:
            house_type_value = house_type_data[row]
            housingTypeButton.setTitle(house_type_value, for: .normal)
            housingTypePicker.isHidden = true
        case housingLocationPicker:
            location_value = location_data[row]
            housingLocationButton.setTitle(location_value, for: .normal)
            housingLocationPicker.isHidden = true
        case bedroomsPicker:
            bedrooms_value = bedrooms_data[row]
            bedroomsButton.setTitle("\(bedrooms_value)", for: .normal)
            bedroomsPicker.isHidden = true
        case bathroomsPicker:
            bathrooms_value = bedrooms_data[row]
            bathroomsButton.setTitle("\(bathrooms_value)", for: .normal)
            bathroomsPicker.isHidden = true
        case flooringPreferencePicker:
            flooring_value = flooring_data[row]
            flooringPreferenceButton.setTitle(flooring_value, for: .normal)
            flooringPreferencePicker.isHidden = true
        default:
            break
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
