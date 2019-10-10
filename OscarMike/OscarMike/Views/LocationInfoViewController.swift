//
//  LocationInfoViewController.swift
//  OscarMike
//
//  Created by Thomas Cowern New on 10/8/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class LocationInfoViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var findSellRealtorLabel: UILabel!
    
    // Variables
    var findSellRealtor : String = "Test"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateInfo()
    }
    
    // Methods
    func updateInfo () {
        print("LocationViewController: " + findSellRealtor)
        findSellRealtorLabel.text = findSellRealtor
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
