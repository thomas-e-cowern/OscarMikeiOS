//
//  FinancialInfoViewController.swift
//  OscarMike
//
//  Created by Thomas Cowern New on 10/10/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit
import MessageUI

class FinancialInfoViewController: UIViewController, UITextFieldDelegate {
    
    // Outlets
    @IBOutlet weak var maxPurchasePriceTextfield: UITextField!
    @IBOutlet weak var desiredPaymentTextfield: UITextField!
    @IBOutlet weak var downPaymentTextfield: UITextField!
    @IBOutlet weak var loanTypeButton: UIButton!
    @IBOutlet weak var preApprovedButton: UIButton!
    @IBOutlet weak var prefferedBankTextfield: UITextField!
    @IBOutlet weak var firstTimeBuyerButton: UIButton!
    @IBOutlet weak var ownPropertyButton: UIButton!
    
    var data: [String] = [""]
    var formattedMessage : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegetes
        maxPurchasePriceTextfield.delegate = self
        desiredPaymentTextfield.delegate = self
        downPaymentTextfield.delegate = self
        prefferedBankTextfield.delegate = self
        
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

    // Actions
    @IBAction func loanTypeButton(_ sender: Any) {
        guard let loanType = loanTypeButton.titleLabel?.text else { return }
        if loanType == "No" {
            loanTypeButton.setTitle("Yes", for: .normal)
        } else {
            loanTypeButton.setTitle("No", for: .normal)
        }
    }
    
    @IBAction func preApprovedButton(_ sender: Any) {
        guard let preApproved = preApprovedButton.titleLabel?.text else { return }
        if preApproved == "No" {
            preApprovedButton.setTitle("Yes", for: .normal)
        } else {
            preApprovedButton.setTitle("No", for: .normal)
        }
    }
    
    @IBAction func firstTimeButton(_ sender: Any) {
        guard let firstTime = firstTimeBuyerButton.titleLabel?.text else { return }
        if firstTime == "No" {
            firstTimeBuyerButton.setTitle("Yes", for: .normal)
        } else {
            firstTimeBuyerButton.setTitle("No", for: .normal)
        }
    }
    
    @IBAction func ownPropertyButton(_ sender: Any) {
        guard let otherProperty = ownPropertyButton.titleLabel?.text else { return }
        if otherProperty == "No" {
            ownPropertyButton.setTitle("Yes", for: .normal)
        } else {
            ownPropertyButton.setTitle("No", for: .normal)
        }
    }
    
    
    
    @IBAction func emailButtonPressed(_ sender: Any) {
        
        guard let maxPurchasePrice = maxPurchasePriceTextfield.text,
            let desiredPayment = desiredPaymentTextfield.text,
            let downPayment = downPaymentTextfield.text,
            let loanType = loanTypeButton.titleLabel?.text,
            let preApproved = preApprovedButton.titleLabel?.text,
            let preferredBank = prefferedBankTextfield.text,
            let firstTime = firstTimeBuyerButton.titleLabel?.text,
            let ownProperty = ownPropertyButton.titleLabel?.text else { return }
        
        saveInfo(userKey: "Max Purchase Price", userValue: maxPurchasePrice)
        saveInfo(userKey: "Desired Payment", userValue: desiredPayment)
        saveInfo(userKey: "Down Payment", userValue: downPayment)
        saveInfo(userKey: "Loan Type", userValue: loanType)
        saveInfo(userKey: "Pre-approved", userValue: preApproved)
        saveInfo(userKey: "Preffered Bank", userValue: preferredBank)
        saveInfo(userKey: "First Time Home Buyer", userValue: firstTime)
        saveInfo(userKey: "Own Other Property", userValue: ownProperty)
        
        formatMessage()
        composeEmail()
    }
    
    func formatMessage () {
        data = getData()
        formattedMessage = "Name: \(data[0]) \n Phone: \(data[1]) \n Email: \(data[2]) \n Service: \(data[3]) \n Assistance requested: \(data[4]) \n Contact Prefference: \(data[5]) \n Location: \(data[6]) \n Base: \(data[7]) \n Married: \(data[8]) \n Kids: \(data[9]) \n Pets: \(data[10]) \n Buy or Rent: \(data[11]) \n Houing Type: \(data[12]) \n Location Type: \(data[13]) \n Sqaure Feet: \(data[14]) \n Bedrooms: \(data[15]) \n Bathrooms: \(data[16]) \n Flooring: \(data[17]) \n Garage: \(data[18]) \n Pool: \(data[19]) \n Yard or Fence: \(data[20]) \n Interior: \(data[21]) \n Max Purchase Price: \(data[22]) \n Desired Payment: \(data[23]) \n Down Payment: \(data[24]) \n Loan Type: \(data[25]) \n Pre-Approved: \(data[26]) \n Preferred Bank: \(data[27]) \n First Time Home Buyer: \(data[28]) \n Own Other Property: \(data[29])"
    }
    
    func showMailError() {
        let sendMailErrorAlert = UIAlertController(title: "Could not send email", message: "Your device could not send email", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    
    func composeEmail () {
        guard MFMailComposeViewController.canSendMail() else {
            print("Error in composeEmail")
            showMailError()
            return
        }
        
        // Test data
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["thomas.e.cowern@gmail.com"])
        composer.setSubject("A New Referral Request")
        composer.setMessageBody(formattedMessage, isHTML: false)
        
        present(composer, animated: true)
    }
}

extension FinancialInfoViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
            controller.dismiss(animated: true)
        }
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case .failed:
            print("Failed")
        case .saved:
            print("Saved")
        case .sent:
            print("Sent")
            
        @unknown default:
            print("@unknown default")
        }
        
        controller.dismiss(animated: true)
    }
}
