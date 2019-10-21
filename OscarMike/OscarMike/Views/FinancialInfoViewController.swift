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
    
    var data: [String] = [""]

    @IBAction func emailButtonPressed(_ sender: Any) {
        print("emailButtonPressed")
        data = getData()
        print(data)
        composeEmail()
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
        composer.setSubject("A New Request")
        composer.setMessageBody("Name: \(data[0]) \n Phone: \(data[1]) \n Email: \(data[2]) \n Service: \(data[3]) \n Assistance requested: \(data[4]) \n Location: \(data[5]) \n Base: \(data[6])", isHTML: false)
        
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
