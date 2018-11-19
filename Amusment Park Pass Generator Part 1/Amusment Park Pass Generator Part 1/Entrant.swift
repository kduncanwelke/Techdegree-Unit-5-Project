//
//  Entrant.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/2/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import Foundation

class Entrant {
    var firstName: String
    var lastName: String
    var birthday: String?
    
    init(firstName: String, lastName: String, birthday: String? = nil) {
        if let birthday = birthday {
            self.birthday = birthday
        }
        
        self.firstName = firstName
        self.lastName = lastName
    }
}


