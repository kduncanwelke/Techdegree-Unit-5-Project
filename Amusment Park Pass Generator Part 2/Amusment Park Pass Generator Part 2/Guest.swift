//
//  Guest.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/2/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import Foundation

class Guest: Entrant, GuestRegistration {
    let type: GuestType
    
    var firstName: String
    var lastName: String
    var birthday: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: Int?
    
    init(type: GuestType, firstName: String, lastName: String, birthday: String?, streetAddress: String?, city: String?, state: String?, zipCode: Int?) {
        
        if let birthday = birthday, let streetAddress = streetAddress, let city = city, let state = state, let zipCode = zipCode {
            self.birthday = birthday
            self.streetAddress = streetAddress
            self.city = city
            self.state = state
            self.zipCode = zipCode
        }
            
        self.type = type
        self.firstName = firstName
        self.lastName = lastName
    }

enum GuestType {
    case Classic
    case Vip
    case FreeChild
    case SeasonPass
    case Senior // in this app senior is considered 65+
    }

}
