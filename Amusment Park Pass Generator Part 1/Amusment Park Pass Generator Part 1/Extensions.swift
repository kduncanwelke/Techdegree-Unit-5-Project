//
//  Extensioons.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/8/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import Foundation

extension Guest {
    // check that all required values are present
    func checkRequirements(entrant: Guest) throws {
        if entrant.firstName == "" {
            throw GuestRegistrationErrors.invalidFirstName
        } else if entrant.lastName == "" {
            throw GuestRegistrationErrors.invalidLastName
        }
        switch entrant.type {
        case .FreeChild:
            if entrant.birthday == nil {
                throw GuestRegistrationErrors.noFreeChildBirthday
            } else if let age = checkAge(birthdayDate: birthday) {
                if age > 5 {
                // birthday was checked for nil so force unwrap is safe
                throw GuestRegistrationErrors.invalidFreeChildBirthday
                }
            }
        default:
            break
        }
    }
    
    // run above function and throw errors
    func isSubmissionErrorFree(entrant: Guest) -> Bool {
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
        } catch let error {
            print("\(error)")
            return false
        }
        print("error free")
        return true
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
    
    func generatePass(entrant: Guest) -> Pass? {
        let success = entrant.isSubmissionErrorFree(entrant: entrant)
        if success {
            let pass = Pass(entrant: entrant)
            return pass
        } else {
            print("Submission not error free, pass not generated")
            return nil
        }
    }
}


extension Employee {
    // check that all required values are present
    func checkRequirements(entrant: Employee) throws {
        if entrant.firstName == "" {
            throw EmployeeRegistrationErrors.invalidFirstName
        } else if entrant.lastName == "" {
            throw EmployeeRegistrationErrors.invalidLastName
        } else if entrant.streetAddress == ""  {
            throw EmployeeRegistrationErrors.invalidAddress
        } else if entrant.city == ""  {
            throw EmployeeRegistrationErrors.invalidCity
        } else if entrant.state == "" {
            throw EmployeeRegistrationErrors.invalidState
        }
        // don't need check for zipcode because init will not succeed without it
    }
    
    // run above function and throw errors
    func isSubmissionErrorFree(entrant: Employee) -> Bool {
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
        } catch let error {
            print("\(error)")
            return false
        }
        print("error free")
        return true
    }
    
    func generatePass(entrant: Employee) -> Pass? {
        let success = entrant.isSubmissionErrorFree(entrant: entrant)
        if success {
            let pass = Pass(entrant: entrant)
            return pass
        } else {
            print("Submission not error free, pass not generated")
            return nil
        }
    }
}
