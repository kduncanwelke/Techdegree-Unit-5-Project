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
    
    case childBirthdayNotConvertibleToDate
    case noFreeChildBirthday
    case invalidFreeChildBirthday
    
    case invalidSeasonPassAddress
    case invalidSeasonPassCity
    case invalidSeasonPassState
    case invalidSeasonPassZipCode
    
    case seniorBirthdayNotConvertibleToDate
    case noSeniorBirthday
    case invalidSeniorBirthday
    
    var localizedDescription: String {
        switch self {
        case .invalidFirstName:
            return "Invalid first name"
        case .invalidLastName:
            return "Invalid last name"
        case .noFreeChildBirthday:
            return "No birthday supplied to verify free child"
        case .childBirthdayNotConvertibleToDate:
            return "Cannot convert input to date"
        case .invalidFreeChildBirthday:
            return "Birthday does not confirm child under 5 years of age"
        case .noSeniorBirthday:
            return "No birthday provided to confirm senior"
        case.seniorBirthdayNotConvertibleToDate:
            return "Cannot convert input to date"
        case.invalidSeniorBirthday:
            return "Birthday does not confirm senior over 65"
        case .invalidSeasonPassAddress:
            return "No address supplied for season pass guest"
        case .invalidSeasonPassCity:
            return "No city supplied for season pass guest"
        case .invalidSeasonPassState:
            return "No state supplied for season pass guest"
        case .invalidSeasonPassZipCode:
            return "No zipcode supplied for season pass guest"
        }
    }
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
    
    var localizedDescription: String {
        switch self {
        case .invalidFirstName:
            return "Invalid first name"
        case .invalidLastName:
            return "Invalid last name"
        case.invalidAddress:
            return "Invalid address"
        case .invalidCity:
            return "Invalid city"
        case .invalidState:
            return "Invalid state"
        case .invalidZipCode:
            return "Invalid zipcode"
        case .invalidContractProjectNumber:
            return "Invalid project number for contract employee"
        case .invalidVendorCompany:
            return "Invalid vendor company"
        case .invalidVendorVisitDate:
            return "Invalid vendor visit date"
        case .invalidVendorBirthday:
            return "Invalid vendor birth date"
        }
    }
}

enum PassSwipeErrors: Error {
    case passSwipedTooSoon
    
    var localizedDescription: String {
        switch self {
        case .passSwipedTooSoon:
            return "Your pass cannot be swiped again immediately - please pause and try again."
        }
    }
}







