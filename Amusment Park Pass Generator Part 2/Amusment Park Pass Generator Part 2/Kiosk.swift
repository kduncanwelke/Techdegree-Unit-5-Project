//
//  Kiosk.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/12/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import Foundation

struct Kiosk {
    
    static func generatePass(entrant: Entrant) throws -> Pass? {
        let success = try entrant.checkRequirements()
        switch entrant {
        case is Guest:
            guard let guest = entrant as? Guest else { return nil }
            
            if success {
                switch guest.type {
                case .classic:
                    let pass = ClassicPass(entrant: guest)
                    return pass
                case .freeChild:
                    let pass = FreeChildPass(entrant: guest)
                    return pass
                case .seasonPass:
                    let pass = SeasonPass(entrant: guest)
                    return pass
                case .senior:
                    let pass = SeniorPass(entrant: guest)
                    return pass
                case .vip:
                    let pass = VipPass(entrant: guest)
                    return pass
                }
            } else {
                print("Submission not error free, pass not generated")
                return nil
            }
            
        case is Employee:
            guard let employee = entrant as? Employee else { return nil }
            
            if success {
                switch employee.type {
                case .contractEmployee:
                    let pass = ContractPass(entrant: employee)
                    return pass
                case .foodService:
                    let pass = FoodServicePass(entrant: employee)
                    return pass
                case .maintenance:
                    let pass = MaintenancePass(entrant: employee)
                    return pass
                case .manager:
                    let pass = ManagerPass(entrant: employee)
                    return pass
                case .rideService:
                    let pass = RideServicesPass(entrant: employee)
                    return pass
                case .vendor:
                    let pass = VendorPass(entrant: employee)
                    return pass
                }
            } else {
                print("Submission not error free, pass not generated")
                return nil
            }
            
        default:
            return nil
        }
    }

    
    // swipe function, checks for birthday and access to given access point
    static func swipe(pass: Pass, forAccessTo: AccessPoint) throws -> (Bool, Bool) {
        
        guard TimerHandling.seconds == 0 else {
            print("Your pass cannot be swiped again immediately - please pause and try again.")
            throw PassSwipeErrors.passSwipedTooSoon
            //return (false, false)
        }
        
        // run timer to ensure pass is not swiped within 5 seconds
        TimerHandling.timer.fire()
        
        let isBirthday = checkForBirthday(personWithPass: pass)
        
        switch forAccessTo {
        case .rides:
            if pass.rideAccess == true {
                return (true, isBirthday)
            } else {
                return (false, isBirthday)
            }
        case .amusements:
            if pass.amusementAccess == true {
                return (true, isBirthday)
            } else {
                return (false, isBirthday)
            }
        case .skipLines:
            if pass.skipRideLines == true {
                return (true, isBirthday)
            } else {
                return (false, isBirthday)
            }
        case .kitchen:
            if pass.kitchenAccess == true {
                return (true, isBirthday)
            } else {
                return (false, isBirthday)
            }
        case .rideControl:
            if pass.rideControlAccess == true {
                return (true, isBirthday)
            } else {
                return (false, isBirthday)
            }
        case .maintenance:
            if pass.maintenanceAccess == true {
                return (true, isBirthday)
            } else {
                return (false, isBirthday)
            }
        case .office:
            if pass.officeAccess == true {
                return (true, isBirthday)
            } else {
                return (false, isBirthday)
            }
        case .foodDiscount:
            if pass.foodDiscount != 0 {
                return (true, isBirthday)
            } else {
                return (false, isBirthday)
            }
        case .merchDiscount:
            if pass.merchandiseDiscount != 0 {
                return (true, isBirthday)
            } else {
                return (false, isBirthday)
            }
        }
        
    }
    
    enum AccessPoint {
        case rides
        case amusements
        case skipLines
        case kitchen
        case rideControl
        case maintenance
        case office
        case foodDiscount
        case merchDiscount
    }
    
    
    // run during swipe to check if it is visitor's birthday
    static func checkForBirthday(personWithPass: Pass) -> Bool {
        
        switch personWithPass {
        case is ClassicPass:
            guard let entry = personWithPass as? ClassicPass else { return false }
            guard let birthday = entry.entrant.birthday else {
                print("No birthday supplied, cannot check for birthday")
                return false
            }
            
            guard let result = doBirthdayCalculations(birthday: birthday) else { return false }
            return result
        case is VipPass:
            guard let entry = personWithPass as? VipPass else { return false }
            guard let birthday = entry.entrant.birthday else {
                print("No birthday supplied, cannot check for birthday")
                return false
            }
            
            guard let result = doBirthdayCalculations(birthday: birthday) else { return false }
            return result
        case is FreeChildPass:
            guard let entry = personWithPass as? FreeChildPass else { return false }
            guard let birthday = entry.entrant.birthday else {
                print("No birthday supplied, cannot check for birthday")
                return false
            }
            
            guard let result = doBirthdayCalculations(birthday: birthday) else { return false }
            return result
        case is SeniorPass:
            guard let entry = personWithPass as? SeniorPass else { return false }
            guard let birthday = entry.entrant.birthday else {
                print("No birthday supplied, cannot check for birthday")
                return false
            }
            
            guard let result = doBirthdayCalculations(birthday: birthday) else { return false }
            return result
        case is SeasonPass:
            guard let entry = personWithPass as? SeasonPass else { return false }
            guard let birthday = entry.entrant.birthday else {
                print("No birthday supplied, cannot check for birthday")
                return false
            }
            
            guard let result = doBirthdayCalculations(birthday: birthday) else { return false }
            return result
        case is FoodServicePass:
            guard let entry = personWithPass as? FoodServicePass else { return false }
            guard let birthday = entry.entrant.birthday else {
                print("No birthday supplied, cannot check for birthday")
                return false
            }
            
            guard let result = doBirthdayCalculations(birthday: birthday) else { return false }
            return result
        case is RideServicesPass:
            guard let entry = personWithPass as? RideServicesPass else { return false }
            guard let birthday = entry.entrant.birthday else {
                print("No birthday supplied, cannot check for birthday")
                return false
            }
            
            guard let result = doBirthdayCalculations(birthday: birthday) else { return false }
            return result
        case is MaintenancePass:
            guard let entry = personWithPass as? MaintenancePass else { return false }
            guard let birthday = entry.entrant.birthday else {
                print("No birthday supplied, cannot check for birthday")
                return false
            }
            
            guard let result = doBirthdayCalculations(birthday: birthday) else { return false }
            return result
        case is ManagerPass:
            guard let entry = personWithPass as? ManagerPass else { return false }
            guard let birthday = entry.entrant.birthday else {
                print("No birthday supplied, cannot check for birthday")
                return false
            }
            
            guard let result = doBirthdayCalculations(birthday: birthday) else { return false }
            return result
        case is VendorPass:
            guard let entry = personWithPass as? VendorPass else { return false }
            guard let birthday = entry.entrant.birthday else {
                print("No birthday supplied, cannot check for birthday")
                return false
            }
            
            guard let result = doBirthdayCalculations(birthday: birthday) else { return false }
            return result
        case is ContractPass:
            guard let entry = personWithPass as? ContractPass else { return false }
            guard let birthday = entry.entrant.birthday else {
                print("No birthday supplied, cannot check for birthday")
                return false
            }
            
            guard let result = doBirthdayCalculations(birthday: birthday) else { return false }
            return result
        default:
            break
        }
        return false // return false if no results
    }
    
    static func doBirthdayCalculations(birthday: String) -> Bool? {
        let date = Date()
        let calendar = Calendar.current
        let currentMonth = calendar.component(.month, from: date)
        let currentDay = calendar.component(.day, from: date)

       
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateFromString = dateFormatter.date(from: birthday)
        
        guard let convertedDate = dateFromString else {
            print("Date not convertable for birthday check")
            return nil
        }
        
        let entrantBirthdayMonth = calendar.component(.month, from: convertedDate)
        let entrantBirthdayDay = calendar.component(.day, from: convertedDate)
        
        if entrantBirthdayMonth == currentMonth && entrantBirthdayDay == currentDay {
            return true
        } else {
            return false
        }
    }

}
