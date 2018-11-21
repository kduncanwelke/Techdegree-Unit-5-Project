//
//  Extensioons.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/8/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import Foundation

extension Entrant {
    // check that all required values are present
    func checkRequirements(entrant: Entrant) throws {
        // check requirements for guest type
        switch entrant {
        case is Guest.Type:
            guard let guest = entrant as? Guest else { return }
            
            if guest.firstName == "" {
                throw GuestRegistrationErrors.invalidFirstName
            } else if guest.lastName == "" {
                throw GuestRegistrationErrors.invalidLastName
            }
            
            switch guest.type {
            case .freeChild:
                if guest.birthday == nil {
                    throw GuestRegistrationErrors.noFreeChildBirthday
                } else if let age = checkAge(birthdayDate: birthday) {
                    if age > 5 {
                        // birthday was checked for nil so force unwrap is safe
                        throw GuestRegistrationErrors.invalidFreeChildBirthday
                    }
                }
            case .senior:
                if guest.birthday == nil {
                    throw GuestRegistrationErrors.noSeniorBirthday
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
                break
            }
        // check requirements for employee type
        case is Employee.Type:
            guard let employee = entrant as? Employee else { return }
            
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
                } else if employee.projectNumber == nil {
                    throw EmployeeRegistrationErrors.invalidContractProjectNumber
                }
            case .vendor:
                if employee.vendorCompany == nil {
                    throw EmployeeRegistrationErrors.invalidVendorCompany
                } else if employee.visitDate == "" {
                    throw EmployeeRegistrationErrors.invalidVendorVisitDate
                } else if employee.birthday == "" {
                    throw EmployeeRegistrationErrors.invalidVendorBirthday
                }
            }
        default:
            break
        }
    }
    
    // check that submission is error-free
    func isSubmissionErrorFree(entrant: Entrant) -> Bool {
        // check guest type for errors
        switch entrant {
        case is Guest.Type:
            do {
                try checkRequirements(entrant: entrant)
            } catch GuestRegistrationErrors.invalidFirstName {
                print("Invalid first name")
                return false
            } catch GuestRegistrationErrors.invalidLastName {
                print("Invalid last name")
                return false
            } catch GuestRegistrationErrors.noFreeChildBirthday {
                print("No birthday supplied to verify free child")
                return false
            } catch GuestRegistrationErrors.invalidFreeChildBirthday {
                print("Birthday does not confirm child under 5 years of age")
                return false
            } catch GuestRegistrationErrors.noSeniorBirthday {
                print("No birthday provided to confirm senior")
                return false
            } catch GuestRegistrationErrors.invalidSeasonPassAddress {
                print("No address supplied for season pass guest")
                return false
            } catch GuestRegistrationErrors.invalidSeasonPassCity {
                print("No city supplied for season pass guest")
                return false
            } catch GuestRegistrationErrors.invalidSeasonPassState {
                print("No state supplied for season pass guest")
                return false
            } catch GuestRegistrationErrors.invalidSeasonPassZipCode {
                print("No zipcode supplied for season pass guest")
                return false
            } catch let error {
                print("\(error)")
                return false
            }
            print("error free")
            return true
        
        // check employee type for errors
        case is Employee.Type:
            do {
                try checkRequirements(entrant: entrant)
            } catch EmployeeRegistrationErrors.invalidFirstName {
                print("Invalid first naeme")
                return false
            } catch EmployeeRegistrationErrors.invalidLastName {
                print("Invalid last name")
                return false
            } catch EmployeeRegistrationErrors.invalidAddress {
                print("Invalid address")
                return false
            } catch EmployeeRegistrationErrors.invalidCity {
                print("Invalid city")
                return false
            } catch EmployeeRegistrationErrors.invalidState {
                print("Invalid state")
                return false
            } catch EmployeeRegistrationErrors.invalidZipCode {
                print("Invalid zipcode")
                return false
            } catch EmployeeRegistrationErrors.invalidContractProjectNumber {
                print("Invalid project number for contract employee")
                return false
            } catch EmployeeRegistrationErrors.invalidVendorCompany {
                print("Invalid vendor company")
                return false
            } catch EmployeeRegistrationErrors.invalidVendorVisitDate {
                print("Invalid vendor visit date")
                return false
            } catch EmployeeRegistrationErrors.invalidVendorBirthday {
                print("Invalid vendor birth date")
                return false
            } catch let error {
                print("\(error)")
                return false
            }
            print("error free")
            return true
            
        default:
            return false
        }
    }

    // run when checking freechild age, converting entered string into date
    func checkAge(birthdayDate: String?) -> Int? {
        let date = Date()
        
        guard let birthday = birthdayDate else {
            print("No birthday supplied for age check")
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateFromString = dateFormatter.date(from: birthday)
        
        guard let convertedDate = dateFromString else {
            print("Date not convertable")
            return nil
        }
        
        // perform math with produced date compared to current date
        guard let difference = Calendar.current.dateComponents([.day], from: convertedDate, to: date).day else {
            print("Calculation failed")
            return nil
        }
        let age = difference / 365
        
        print("\(age)")
        return age
        
    }
}


