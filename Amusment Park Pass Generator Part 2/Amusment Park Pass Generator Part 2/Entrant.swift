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
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: Int?
    
    init(firstName: String, lastName: String, birthday: String? = nil, streetAddress: String? = nil, city: String? = nil, state: String? = nil, zipCode: Int? = nil ) {
        if let birthday = birthday, let streetAddress = streetAddress, let city = city, let state = state, let zipCode = zipCode {
            self.birthday = birthday
            self.streetAddress = streetAddress
            self.city = city
            self.state = state
            self.zipCode = zipCode
        }
        
        self.firstName = firstName
        self.lastName = lastName
    }
}


