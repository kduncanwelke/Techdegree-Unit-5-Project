//
//  Employee.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/2/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import Foundation

class Employee: Entrant, EmployeeRegistration {
    
    let type: EmployeeType
    let streetAddress: String
    let city: String
    let state: String
    let zipCode: Int
    
    init(type: EmployeeType, streetAddress: String, city: String, state: String, zipCode: Int, firstName: String, lastName: String, birthday: String?) {
        self.type = type
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        
        super.init(firstName: firstName, lastName: lastName, birthday: birthday)
    }
}

enum EmployeeType {
    case FoodService
    case RideService
    case Maintenance
    case Manager
}


