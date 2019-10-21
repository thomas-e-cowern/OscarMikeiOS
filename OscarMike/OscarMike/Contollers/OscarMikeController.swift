//
//  OscarMikeController.swift
//  OscarMike
//
//  Created by Thomas Cowern New on 10/21/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

var defaults = UserDefaults.standard

func saveInfo (userKey: String, userValue: String) {
    defaults.set(userValue, forKey: userKey)
}

