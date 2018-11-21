//
//  Kiosk.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/12/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import Foundation

struct Kiosk {
    
    static func generatePass<T:Entrant>(entrant: T) -> Pass? {
        let success = entrant.isSubmissionErrorFree(entrant: entrant)
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
    static func swipe(pass: Pass, forAccessTo: AccessPoint) -> Bool {
        guard TimerHandling.seconds == 0 else {
            print("Your pass cannot be swiped again immediately - please pause and try again.")
            return false
        }
        
        // run timer to ensure pass is not swiped within 5 seconds
        TimerHandling.timer.fire()
        
       // checkForBirthday(personWithPass: pass)
        switch forAccessTo {
        case .rides:
            if pass.rideAccess == true {
                print("Able to access rides")
                return true
            } else {
                print("Access to rides denied")
                return false
            }
        case .amusements:
            if pass.amusementAccess == true {
                print("Able to access amusements")
                return true
            } else {
                print("Access to amusements denied")
                return false
            }
        case .skipLines:
            if pass.skipRideLines == true {
                print("Able to skip ride lines")
                return true
            } else {
                print("Access to skipping ride lines denied")
                return false
            }
        case .kitchen:
            if pass.kitchenAccess == true {
                print("Able to access kitchen")
                return true
            } else {
                print("Access to kitchen denied")
                return false
            }
        case .rideControl:
            if pass.rideControlAccess == true {
                print("Able to access ride control")
                return true
            } else {
                print("Access to ride control denied")
                return false
            }
        case .maintenance:
            if pass.maintenanceAccess == true {
                print("Able to access maintenance")
                return true
            } else {
                print("Access to maintenance denied")
                return false
            }
        case .office:
            if pass.officeAccess == true {
                print("Able to access office")
                return true
            } else {
                print("Access to office denied")
                return false
            }
        case .foodDiscount:
            if pass.foodDiscount != 0 {
                print("Discount of \(pass.foodDiscount)")
                return true
            } else {
                print("No discount available")
                return false
            }
        case .merchDiscount:
            if pass.merchandiseDiscount != 0 {
                print("Discount of \(pass.merchandiseDiscount)")
                return true
            } else {
                print("No discount available")
                return false
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
    static func checkForBirthday<T>(personWithPass: T) where T:Entrant {
        let date = Date()
        let calendar = Calendar.current
        let currentMonth = calendar.component(.month, from: date)
        let currentDay = calendar.component(.day, from: date)
        
        guard let birthday = personWithPass.birthday else {
            print("No birthday supplied, cannot check for birthday")
            return
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateFromString = dateFormatter.date(from: birthday)
        
        guard let convertedDate = dateFromString else {
            print("Date not convertable")
            return
        }
        
        let entrantBirthdayMonth = calendar.component(.month, from: convertedDate)
        let entrantBirthdayDay = calendar.component(.day, from: convertedDate)
        
        if entrantBirthdayMonth == currentMonth && entrantBirthdayDay == currentDay {
            print("Happy birthday \(personWithPass.firstName) \(personWithPass.lastName)!")
        }
        
    }

}
