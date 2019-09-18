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
    
    // Variables
    var buy_rent_data: [String] = [String]()
    var buy_rent_value: String = ""
    var pcs_date_string: String = ""
    
    // Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // buy_rent_pickerView data
        buy_rent_pickerView.delegate = self
        buy_rent_pickerView.dataSource = self
        buy_rent_data = ["Buy", "Rent", "Buy or Rent"]
        
        hideBuyRentPickerView()
        pcs_date_pickerView.isHidden = true
        pcs_save_date_button.isHidden = true
        
    }
    
    // buy_rent_pickerView functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return buy_rent_data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return buy_rent_data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 25
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        // Get the value, set button title, and hide the picker
        buy_rent_value = buy_rent_data[row]
        buy_rent_button.setTitle(buy_rent_value, for: .normal)
        buy_rent_pickerView.isHidden = true
        
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
    
    // Actions
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
