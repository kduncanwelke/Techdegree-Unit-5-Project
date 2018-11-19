//
//  Guest.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/2/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import Foundation

class Guest: Entrant, GuestRegistration {
    var type: GuestType
    
    init(type: GuestType, firstName: String, lastName: String, birthday: String?, streetAddress: String?, city: String?, state: String?, zipCode: Int?) {
        self.type = type
        
        super.init(firstName: firstName, lastName: lastName, birthday: birthday, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
    }
}

enum GuestType {
    case Classic
    case Vip
    case FreeChild
    case SeasonPass
    case Senior // in this app senior is considered 65+
}

