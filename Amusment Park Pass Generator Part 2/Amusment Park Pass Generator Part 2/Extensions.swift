//
//  Extensioons.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/8/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import Foundation
import UIKit

extension Entrant {
    // check that all required values are present
    
    func checkRequirements() throws -> Bool {
        // check requirements for guest type
        switch self {
        case let guest as Guest:
        
            if guest.firstName == "" {
                throw GuestRegistrationErrors.invalidFirstName
            } else if guest.lastName == "" {
                throw GuestRegistrationErrors.invalidLastName
            }
            
            switch guest.type {
            case .freeChild:
                if guest.birthday == "" {
                    throw GuestRegistrationErrors.noFreeChildBirthday
                } else if convertDate(birthdayDate: birthday) == nil {
                    throw GuestRegistrationErrors.childBirthdayNotConvertibleToDate
                } else if let age = checkAge(birthdayDate: birthday) {
                    if age > 5 {
                        // birthday was checked for nil so force unwrap is safe
                        throw GuestRegistrationErrors.invalidFreeChildBirthday
                    }
                }
            case .senior:
                if guest.birthday == "" {
                    throw GuestRegistrationErrors.noSeniorBirthday
                } else if convertDate(birthdayDate: birthday) == nil {
                    throw GuestRegistrationErrors.seniorBirthdayNotConvertibleToDate
                    // error if date cannot be converted
                } else if let age = checkAge(birthdayDate: birthday) {
                    if age < 65 {
                        // birthday was checked for nil so force unwrap is safe
                        throw GuestRegistrationErrors.invalidSeniorBirthday
                        // only allow senior if guest is 65+
                    }
                }
            case .seasonPass:
                if guest.streetAddress == "" {
                    throw GuestRegistrationErrors.invalidSeasonPassAddress
                } else if guest.city == "" {
                    throw GuestRegistrationErrors.invalidSeasonPassCity
                } else if guest.state == "" {
                    throw GuestRegistrationErrors.invalidSeasonPassState
                } else if guest.zipCode == nil {
                    throw GuestRegistrationErrors.invalidSeasonPassZipCode
                }
            default:
                return true
            }
        // check requirements for employee type
        case let employee as Employee:
            
            if employee.firstName == "" {
                throw EmployeeRegistrationErrors.invalidFirstName
            } else if employee.lastName == "" {
                throw EmployeeRegistrationErrors.invalidLastName
            }
            
            switch employee.type {
            case .foodService, .rideService, .maintenance, .manager:
                if employee.streetAddress == ""  {
                    throw EmployeeRegistrationErrors.invalidAddress
                } else if employee.city == ""  {
                    throw EmployeeRegistrationErrors.invalidCity
                } else if employee.state == "" {
                    throw EmployeeRegistrationErrors.invalidState
                } else if employee.zipCode == nil {
                    throw EmployeeRegistrationErrors.invalidZipCode
                }
            case .contractEmployee:
                if employee.streetAddress == ""  {
                    throw EmployeeRegistrationErrors.invalidAddress
                } else if employee.city == ""  {
                    throw EmployeeRegistrationErrors.invalidCity
                } else if employee.state == "" {
                    throw EmployeeRegistrationErrors.invalidState
                } else if employee.zipCode == nil {
                    throw EmployeeRegistrationErrors.invalidZipCode
                } else if employee.projectNumber?.rawValue != nil {
                    if employee.projectNumber!.rawValue != ContractEmployeeProjectNumbers.firstContract.rawValue || employee.projectNumber!.rawValue != ContractEmployeeProjectNumbers.secondContract.rawValue || employee.projectNumber!.rawValue != ContractEmployeeProjectNumbers.thirdContract.rawValue || employee.projectNumber!.rawValue != ContractEmployeeProjectNumbers.fourthContract.rawValue || employee.projectNumber!.rawValue != ContractEmployeeProjectNumbers.fifthContract.rawValue {
                    throw EmployeeRegistrationErrors.invalidContractProjectNumber
                    }
                }
            case .vendor:
                if employee.vendorCompany?.rawValue != nil {
                    if employee.vendorCompany!.rawValue != VendorCompanies.acme.rawValue || employee.vendorCompany!.rawValue != VendorCompanies.fedex.rawValue || employee.vendorCompany!.rawValue != VendorCompanies.nwElectrical.rawValue || employee.vendorCompany!.rawValue != VendorCompanies.orkin.rawValue {
                        throw EmployeeRegistrationErrors.invalidVendorCompany
                    }
                } else if employee.visitDate == "" {
                    throw EmployeeRegistrationErrors.invalidVendorVisitDate
                } else if employee.birthday == "" {
                    throw EmployeeRegistrationErrors.invalidVendorBirthday
                }
            }
        default:
            return true
        }
        return true // if switch is completed without throwing errors return true
    }

    // run when checking freechild age, converting entered string into date
    func checkAge(birthdayDate: String?) -> Int? {
        let date = Date()
        
        guard let convertedDate = convertDate(birthdayDate: birthdayDate) else { return nil }
        
        // perform math with produced date compared to current date
        guard let difference = Calendar.current.dateComponents([.day], from: convertedDate, to: date).day else {
            print("Calculation failed")
            return nil
        }
        let age = difference / 365
        
        print("\(age)")
        return age
        
    }
    
    func convertDate(birthdayDate: String?) -> Date? {
        if let birthday = birthdayDate {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let dateFromString = dateFormatter.date(from: birthday)
            
            guard let convertedDate = dateFromString else {
                print("Date not convertable")
                return nil
            }
            return convertedDate
        } else {
            print("No birthday supplied for age check")
            return nil
        }
    }
    
}

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}




