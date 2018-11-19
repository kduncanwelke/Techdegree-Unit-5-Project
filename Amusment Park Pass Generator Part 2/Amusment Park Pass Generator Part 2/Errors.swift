//
//  GuestErrors.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/6/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import Foundation

// Entrant registration errors
enum RegistrationErrors: Error {
    case invalidFirstName
    case invalidLastName
}

// Guest registration errors
enum GuestRegistrationErrors: Error {
    case invalidFirstName
    case invalidLastName
    
    case noFreeChildBirthday
    case invalidFreeChildBirthday
    
    case invalidSeasonPassAddress
    case invalidSeasonPassCity
    case invalidSeasonPassState
    case invalidSeasonPassZipCode
    
    case noSeniorBirthday
    case invalidSeniorBirthday
}

// Employee registration errors
enum EmployeeRegistrationErrors: Error {
    case invalidFirstName
    case invalidLastName
    
    case invalidAddress
    case invalidCity
    case invalidState
    case invalidZipCode
    
    case invalidContractProjectNumber
    
    case invalidVendorCompany
    case invalidVendorBirthday
    case invalidVendorVisitDate
}
