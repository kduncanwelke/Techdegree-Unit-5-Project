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
    var vendorCompany: VendorCompanies?
    var visitDate: String?
    var projectNumber: ContractEmployeeProjectNumbers?
    
    init(type: EmployeeType, firstName: String, lastName: String, birthday: String?, streetAddress: String?, city: String?, state: String?, zipCode: Int?, vendorCompany: VendorCompanies? = nil, visitDate: String? = nil, projectNumber: ContractEmployeeProjectNumbers? = nil) {
        self.type = type
        
        if let vendorCompany = vendorCompany, let visitDate = visitDate, let projectNumber = projectNumber {
            self.vendorCompany = vendorCompany
            self.visitDate = visitDate
            self.projectNumber = projectNumber
        }
        
        super.init(firstName: firstName, lastName: lastName, birthday: birthday, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
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


