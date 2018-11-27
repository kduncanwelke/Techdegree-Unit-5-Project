//
//  Guest.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/2/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import Foundation

class Guest: Entrant {
    var type: GuestType
    
    var firstName: String
    var lastName: String
    var birthday: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: Int?
    
    init(type: GuestType, firstName: String, lastName: String, birthday: String?, streetAddress: String?, city: String?, state: String?, zipCode: Int?) {
        
        if let birthday = birthday {
            self.birthday = birthday
        }
        
        if let streetAddress = streetAddress {
            self.streetAddress = streetAddress
        }
        
        if let city = city {
            self.city = city
        }
        
        if let state = state {
            self.state = state
        }
        
        if let zipCode = zipCode {
            self.zipCode = zipCode
        }
        
            
        self.type = type
        self.firstName = firstName
        self.lastName = lastName
    }

    enum GuestType {
    case classic
    case vip
    case freeChild
    case seasonPass
    case senior // in this app senior is considered 65+
    }

}
