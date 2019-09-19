//
//  HomeViewController.swift
//  OscarMike
//
//  Created by Thomas Cowern New on 9/16/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    //  Outlets
    @IBOutlet weak var married_button: UIButton!
    @IBOutlet weak var kids_button: UIButton!
    @IBOutlet weak var pets_button: UIButton!
    @IBOutlet weak var location_textField: UITextField!
    @IBOutlet weak var base_textField: UITextField!
    @IBOutlet weak var buy_rent_button: UIButton!
    @IBOutlet weak var buy_rent_pickerView: UIPickerView!
    @IBOutlet weak var pcs_date_button: UIButton!
    @IBOutlet weak var pcs_date_pickerView: UIDatePicker!
    @IBOutlet weak var pcs_save_date_button: UIButton!
    @IBOutlet weak var house_type_button: UIButton!
    @IBOutlet weak var house_type_pickerView: UIPickerView!
    @IBOutlet weak var location_button: UIButton!
    @IBOutlet weak var location_pickerView: UIPickerView!
    @IBOutlet weak var sqaure_foot_textField: UITextField!
    @IBOutlet weak var bedrooms_button: UIButton!
    @IBOutlet weak var bedrooms_pickerView: UIPickerView!
    @IBOutlet weak var bathrooms_button: UIButton!
    @IBOutlet weak var bathrooms_pickerView: UIPickerView!
    @IBOutlet weak var flooring_button: UIButton!
    @IBOutlet weak var flooring_pickerView: UIPickerView!
    
    // Variables
    var buy_rent_data: [String] = [String]()
    var house_type_data: [String] = [String]()
    var locstion_data: [String] = [String]()
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
    
    // Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Delegates
        buy_rent_pickerView.delegate = self
        buy_rent_pickerView.dataSource = self
        house_type_pickerView.delegate = self
        house_type_pickerView.dataSource = self
        location_pickerView.delegate = self
        location_pickerView.dataSource = self
        bedrooms_pickerView.delegate = self
        bedrooms_pickerView.dataSource = self
        bathrooms_pickerView.delegate = self
        bathrooms_pickerView.dataSource = self
        flooring_pickerView.delegate = self
        flooring_pickerView.dataSource = self
        
        
        // Data
        buy_rent_data = ["Buy", "Rent", "Buy or Rent"]
        house_type_data = ["House", "Condo", "Apartment"]
        locstion_data = ["Urban", "Suburban", "Rural"]
        bedrooms_data = [1, 2, 3, 4, 5, 6]
        bathrooms_data = [1, 2, 3, 4]
        flooring_data = ["Carpet", "Tile", "Wood", "Linoleum"]
        
        
        
        // Pickerview & button set-up
        hideBuyRentPickerView()
        pcs_date_pickerView.isHidden = true
        pcs_save_date_button.isHidden = true
        house_type_pickerView.isHidden = true
        location_pickerView.isHidden = true
        bedrooms_pickerView.isHidden = true
        bathrooms_pickerView.isHidden = true
        flooring_pickerView.isHidden = true
        
    }
    
    // buy_rent_pickerView functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView {
        case buy_rent_pickerView:
            return 1
        case house_type_pickerView:
            return 1
        case location_pickerView:
            return 1
        case bedrooms_pickerView:
            return 1
        case bathrooms_pickerView:
            return 1
        case flooring_pickerView:
            return 1
        default:
            return 0
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case buy_rent_pickerView:
            return buy_rent_data.count
        case house_type_pickerView:
            return house_type_data.count
        case location_pickerView:
            return locstion_data.count
        case bedrooms_pickerView:
            return bedrooms_data.count
        case bathrooms_pickerView:
            return bathrooms_data.count
        case flooring_pickerView:
            return flooring_data.count
        default:
            return 0
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case buy_rent_pickerView:
            return buy_rent_data[row]
        case house_type_pickerView:
            return house_type_data[row]
        case location_pickerView:
            return locstion_data[row]
        case bedrooms_pickerView:
            return "\(bedrooms_data[row])"
        case bathrooms_pickerView:
            return "\(bathrooms_data[row])"
        case flooring_pickerView:
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
        case buy_rent_pickerView:
            buy_rent_value = buy_rent_data[row]
            buy_rent_button.setTitle(buy_rent_value, for: .normal)
            buy_rent_pickerView.isHidden = true
        case house_type_pickerView:
            house_type_value = house_type_data[row]
            house_type_button.setTitle(house_type_value, for: .normal)
            house_type_pickerView.isHidden = true
        case location_pickerView:
            location_value = locstion_data[row]
            location_button.setTitle(location_value, for: .normal)
            location_pickerView.isHidden = true
        case bedrooms_pickerView:
            bedrooms_value = bedrooms_data[row]
            bedrooms_button.setTitle("\(bedrooms_value)", for: .normal)
            bedrooms_pickerView.isHidden = true
        case bathrooms_pickerView:
            bathrooms_value = bedrooms_data[row]
            bathrooms_button.setTitle("\(bathrooms_value)", for: .normal)
            bathrooms_pickerView.isHidden = true
        case flooring_pickerView:
            flooring_value = flooring_data[row]
            flooring_button.setTitle(flooring_value, for: .normal)
            flooring_pickerView.isHidden = true
        default:
            break
        }
        
        
    }
    
    func hideBuyRentPickerView() {
        buy_rent_pickerView.isHidden = true
    }
    
    // PCS Date functions
    @IBAction func pcs_button_pressed(_ sender: Any) {
        pcs_date_pickerView.isHidden = false
        pcs_save_date_button.isHidden = false
    }
    
    @IBAction func pcsDateChanged(_ sender: Any) {

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        pcs_date_string = dateFormatter.string(from: pcs_date_pickerView.date)
        pcs_date_button.setTitle(pcs_date_string, for: .normal)
        
    }
    
    @IBAction func save_date_button_pressed(_ sender: Any) {
        
        pcs_date_pickerView.isHidden = true
        pcs_save_date_button.isHidden = true
    }
    
    // Lifestyle
    @IBAction func married_button(_ sender: Any) {

        guard let status = married_button.titleLabel?.text else { return }
     
        if status == "No" {
            married_button.setTitle("Yes", for: .normal)
        } else {
            married_button.setTitle("No", for: .normal)
        }
        
    }
    
    @IBAction func kids_button(_ sender: Any) {
        
        guard let status = kids_button.titleLabel?.text else { return }
        
        if status == "No" {
            kids_button.setTitle("Yes", for: .normal)
        } else {
            kids_button.setTitle("No", for: .normal)
        }
    }
    
    @IBAction func pets_button(_ sender: Any) {
        
        guard let status = pets_button.titleLabel?.text else { return }
        
        if status == "No" {
            pets_button.setTitle("Yes", for: .normal)
        } else {
            pets_button.setTitle("No", for: .normal)
        }
    }
    
    @IBAction func but_rent_button_pressed(_ sender: Any) {
        
        buy_rent_pickerView.isHidden = false
    }
    
    
    // House type
    @IBAction func house_type_pressed(_ sender: Any) {
        house_type_pickerView.isHidden = false
    }
    
    // Location
    @IBAction func location_button_pressed(_ sender: Any) {
        location_pickerView.isHidden = false
    }
    
    // Bedrooms
    @IBAction func bedrooms_button_pressed(_ sender: Any) {
        bedrooms_pickerView.isHidden = false
    }
    
    // Bathrooms
    @IBAction func bathrooms_buttton_pressed(_ sender: Any) {
        bathrooms_pickerView.isHidden = false
    }
    
    // Flooring
    @IBAction func flooring_button_pressed(_ sender: Any) {
        flooring_pickerView.isHidden = false
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
