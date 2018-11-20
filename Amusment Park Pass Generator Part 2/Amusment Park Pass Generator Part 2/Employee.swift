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
    
    var firstName: String
    var lastName: String
    var birthday: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: Int?
    
    var vendorCompany: VendorCompanies?
    var visitDate: String?
    var projectNumber: ContractEmployeeProjectNumbers?
    
    init(type: EmployeeType, firstName: String, lastName: String, birthday: String?, streetAddress: String?, city: String?, state: String?, zipCode: Int?, vendorCompany: VendorCompanies? = nil, visitDate: String? = nil, projectNumber: ContractEmployeeProjectNumbers? = nil) {
        
        if let birthday = birthday, let streetAddress = streetAddress, let city = city, let state = state, let zipCode = zipCode, let vendorCompany = vendorCompany, let visitDate = visitDate, let projectNumber = projectNumber {
            self.birthday = birthday
            self.streetAddress = streetAddress
            self.city = city
            self.state = state
            self.zipCode = zipCode
            self.vendorCompany = vendorCompany
            self.visitDate = visitDate
            self.projectNumber = projectNumber
        }
        
        self.type = type
        self.firstName = firstName
        self.lastName = lastName
    }
}

enum EmployeeType {
    case FoodService
    case RideService
    case Maintenance
    case Manager
    case ContractEmployee
    case Vendor
}


