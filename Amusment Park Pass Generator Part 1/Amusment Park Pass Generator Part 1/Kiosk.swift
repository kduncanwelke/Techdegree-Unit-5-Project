//
//  Kiosk.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/12/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import Foundation

struct Kiosk {
    // swipe function, checks for birthday and access to given access point
    static func swipe(pass: Pass, forAccessTo: AccessPoint) -> Bool {
        guard TimerHandling.seconds == 0 else {
            print("Your pass cannot be swiped again immediately - please pause and try again.")
            return false
        }
        
        // run timer to ensure pass is not swiped within 5 seconds
        TimerHandling.timer.fire()
        
        checkForBirthday(personWithPass: pass)
        switch forAccessTo {
        case .Rides:
            if pass.rideAccess == true {
                print("Able to access rides")
                return true
            } else {
                print("Access to rides denied")
                return false
            }
        case .Amusements:
            if pass.amusementAccess == true {
                print("Able to access amusements")
                return true
            } else {
                print("Access to amusements denied")
                return false
            }
        case .SkipLines:
            if pass.skipRideLines == true {
                print("Able to skip ride lines")
                return true
            } else {
                print("Access to skipping ride lines denied")
                return false
            }
        case .Kitchen:
            if pass.kitchenAccess == true {
                print("Able to access kitchen")
                return true
            } else {
                print("Access to kitchen denied")
                return false
            }
        case .RideControl:
            if pass.rideControlAccess == true {
                print("Able to access ride control")
                return true
            } else {
                print("Access to ride control denied")
                return false
            }
        case .Maintenance:
            if pass.maintenanceAccess == true {
                print("Able to access maintenance")
                return true
            } else {
                print("Access to maintenance denied")
                return false
            }
        case .Office:
            if pass.officeAccess == true {
                print("Able to access office")
                return true
            } else {
                print("Access to office denied")
                return false
            }
        case .FoodDiscount:
            if pass.foodDiscount != 0 {
                print("Discount of \(pass.foodDiscount)")
                return true
            } else {
                print("No discount available")
                return false
            }
        case .MerchDiscount:
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
        case Rides
        case Amusements
        case SkipLines
        case Kitchen
        case RideControl
        case Maintenance
        case Office
        case FoodDiscount
        case MerchDiscount
    }
    
    // run during swipe to check if it is visitor's birthday
    static func checkForBirthday(personWithPass: Pass) {
        let date = Date()
        let calendar = Calendar.current
        let currentMonth = calendar.component(.month, from: date)
        let currentDay = calendar.component(.day, from: date)
        
        guard let birthday = personWithPass.entrant.birthday else {
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
            print("Happy birthday \(personWithPass.entrant.firstName) \(personWithPass.entrant.lastName)!")
        }
        
    }

}
