//
//  FinancialInfoViewController.swift
//  OscarMike
//
//  Created by Thomas Cowern New on 10/10/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit
import MessageUI

class FinancialInfoViewController: UIViewController {


    @IBAction func emailButtonPressed(_ sender: Any) {
        print("emailButtonPressed")
        composeEmail()
    }
    
    func composeEmail () {
        guard MFMailComposeViewController.canSendMail() else {
            print("Error in composeEmail")
            return
        }
        
        // Test data
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["thomas.e.cowern@gmail.com"])
        composer.setSubject("A New Request")
        composer.setMessageBody("Name: ", isHTML: false)
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
