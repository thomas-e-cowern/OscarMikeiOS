//
//  FindSellViewController.swift
//  OscarMike
//
//  Created by Thomas Cowern New on 10/8/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class FindSellViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var findAHomeButton: UIButton!
    @IBOutlet weak var sellAHomeButton: UIButton!
    @IBOutlet weak var findARealtor: UIButton!
    
    // Variables
    var buySellRealtor : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Actions
    @IBAction func chooseBuySellFind(_ sender: UIButton) {
        switch sender.tag {
               case 0:
                   buySellRealtor = "Find a Home"
               case 1:
                   buySellRealtor = "Sell a Home"
               case 2:
                   buySellRealtor = "Find a Realtor"
               default:
                   buySellRealtor = "Error in choosing option"
               }
        
        saveInfo(userKey: Referral.buySellFind, userValue: buySellRealtor)
        
        performSegue(withIdentifier: "locationSegue", sender: self)
    }
    
    func printButton(str: String) {
        print(str)
    }
    
    func determineFindSellRealtor (str: String) {
        switch str {
        case "FH":
            buySellRealtor = "Find a Home"
        case "SH":
            buySellRealtor = "Sell a Home"
        case "FR":
            buySellRealtor = "Find a Realtor"
        default:
            buySellRealtor = "Error in choosing option"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("FSViewController: \(buySellRealtor)")
            if segue.destination is LocationInfoViewController {
                let vc = segue.destination as? LocationInfoViewController
                vc?.findSellRealtor = buySellRealtor
            }
    }
}
