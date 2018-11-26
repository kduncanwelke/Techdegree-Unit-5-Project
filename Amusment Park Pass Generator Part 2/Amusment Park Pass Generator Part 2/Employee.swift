//
//  Employee.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/2/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import Foundation

class Employee: Entrant {
    var type: EmployeeType
    
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
        
        if let vendorCompany = vendorCompany {
            self.vendorCompany = vendorCompany
        }
        
        if let visitDate = visitDate {
            self.visitDate = visitDate
        }
        
        if let projectNumber = projectNumber {
            self.projectNumber = projectNumber
        }
        
        
        self.type = type
        self.firstName = firstName
        self.lastName = lastName
    }
    
    enum EmployeeType {
        case foodService
        case rideService
        case maintenance
        case manager
        case contractEmployee
        case vendor
    }

}



