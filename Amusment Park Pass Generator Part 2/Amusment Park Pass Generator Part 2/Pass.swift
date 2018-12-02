//
//  Pass.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/2/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import Foundation

// base for pass, it's here rather than the protocols file cause it reads better
protocol Pass {
    var rideAccess: Bool { get set }
    var amusementAccess: Bool { get set }
    var skipRideLines: Bool { get set }
    var kitchenAccess: Bool { get set }
    var rideControlAccess: Bool { get set }
    var maintenanceAccess: Bool { get set }
    var officeAccess: Bool { get set }
    var foodDiscount: Int { get set }
    var merchandiseDiscount: Int { get set }
    
    var passType: String { get set }
    var passDetails: String { get set }
}

// classic pass
class ClassicPass: Pass, GuestEntrant {
    var entrant: Guest
    var rideAccess = true
    var amusementAccess = true
    var skipRideLines = false
    var kitchenAccess = false
    var rideControlAccess = false
    var maintenanceAccess = false
    var officeAccess = false
    var foodDiscount = 0
    var merchandiseDiscount = 0
    var passType = PassType.classicPass.rawValue
    var passDetails = "Basic amusement park access"
    
    init(entrant: Guest) {
        self.entrant = entrant
    }
}

// VIP pass
class VipPass: Pass, GuestEntrant {
    var entrant: Guest
    
    var rideAccess = true
    var amusementAccess = true
    var kitchenAccess = false
    var rideControlAccess = false
    var maintenanceAccess = false
    var officeAccess = false
    
    var skipRideLines = true
    var foodDiscount = 10
    var merchandiseDiscount = 20
    var passType = PassType.vipPass.rawValue
    var passDetails = "Upgraded access with the ability to skip lines"
    
    init(entrant: Guest) {
        self.entrant = entrant
    }
}

// free child pass
class FreeChildPass: Pass, GuestEntrant {
    var entrant: Guest
    
    var rideAccess = true
    var amusementAccess = true
    var skipRideLines = false
    var kitchenAccess = false
    var rideControlAccess = false
    var maintenanceAccess = false
    var officeAccess = false
    var foodDiscount = 0
    var merchandiseDiscount = 0
    
    var passType = PassType.freeChildPass.rawValue
    var passDetails = "Free pass for child under 5"
    
    init(entrant: Guest) {
        self.entrant = entrant
    }
}

// season guest pass
class SeasonPass: Pass, GuestEntrant {
    var entrant: Guest
    
    var rideAccess = true
    var amusementAccess = true
    var kitchenAccess = false
    var rideControlAccess = false
    var maintenanceAccess = false
    var officeAccess = false
    
    var skipRideLines = true
    var foodDiscount = 10
    var merchandiseDiscount = 20
    var passType = PassType.seasonPass.rawValue
    var passDetails = "Season pass for frequent visitors, includes discounts"
    
    init(entrant: Guest) {
        self.entrant = entrant
    }
}

// senior pass
class SeniorPass: Pass, GuestEntrant {
    var entrant: Guest
    
    var rideAccess = true
    var amusementAccess = true
    var kitchenAccess = false
    var rideControlAccess = false
    var maintenanceAccess = false
    var officeAccess = false
    
    var skipRideLines = true
    var foodDiscount = 10
    var merchandiseDiscount = 10
    var passType = PassType.seniorPass.rawValue
    var passDetails = "Special pass for visitors 65+, includes discounts"
    
    init(entrant: Guest) {
        self.entrant = entrant
    }
}

// food services employee pass
class FoodServicePass: Pass, EmployeeEntrant {
    var entrant: Employee
    
    var rideAccess = true
    var amusementAccess = true
    var skipRideLines = false
    var rideControlAccess = false
    var maintenanceAccess = false
    var officeAccess = false
    
    var kitchenAccess = true
    var foodDiscount = 15
    var merchandiseDiscount = 25
    var passType = PassType.foodServicePass.rawValue
    var passDetails = "Pass for employees who work in food service, includes discounts"
    
    init(entrant: Employee) {
        self.entrant = entrant
    }
}

// ride services employee pass
class RideServicesPass: Pass, EmployeeEntrant {
    var entrant: Employee
    
    var rideAccess = true
    var amusementAccess = true
    var skipRideLines = false
    var kitchenAccess = false
    var maintenanceAccess = false
    var officeAccess = false

    var rideControlAccess = true
    var foodDiscount = 15
    var merchandiseDiscount = 25
    var passType = PassType.rideServicePass.rawValue
    var passDetails = "Pass for employees who work in ride service, includes discounts"
    
    init(entrant: Employee) {
        self.entrant = entrant
    }
}

// maintenance employee pass
class MaintenancePass: Pass, EmployeeEntrant {
    var entrant: Employee
    
    var rideAccess = true
    var amusementAccess = true
    var skipRideLines = false
    var officeAccess = false
    
    var kitchenAccess = true
    var rideControlAccess = true
    var maintenanceAccess = true
    var foodDiscount = 15
    var merchandiseDiscount = 25
    var passType = PassType.maintenancePass.rawValue
    var passDetails = "Pass for employees who work in maintenance, includes discounts"
    
    init(entrant: Employee) {
        self.entrant = entrant
    }
}

// manager pass
class ManagerPass: Pass, EmployeeEntrant {
    var entrant: Employee
    
    var rideAccess = true
    var amusementAccess = true
    var skipRideLines = false
    
    var officeAccess = true
    var kitchenAccess = true
    var rideControlAccess = true
    var maintenanceAccess = true
    var foodDiscount = 25
    var merchandiseDiscount = 25
    var passType = PassType.managerPass.rawValue
    var passDetails = "Pass for manager with complete access, includes discounts"
    
    init(entrant: Employee) {
        self.entrant = entrant
    }
}

// contract employee pass
class ContractPass: Pass, EmployeeEntrant {

    var entrant: Employee
    
    var skipRideLines = false
    var foodDiscount = 0
    var merchandiseDiscount = 0
    var rideAccess = false
    
    var passDetails = "Pass for contract employees"
    
    lazy var amusementAccess: Bool = {
        switch entrant.projectNumber {
        case .firstContract?, .secondContract?, .thirdContract?:
            return true
        default:
            return false
        }
    }()
    lazy var rideControlAccess: Bool = {
        switch entrant.projectNumber {
        case .firstContract?, .secondContract?, .thirdContract?:
            return true
        default:
            return false
        }
    }()
    lazy var kitchenAccess: Bool = {
        switch entrant.projectNumber {
        case .thirdContract?, .fifthContract?:
            return true
        default:
            return false
        }
    }()
    lazy var maintenanceAccess: Bool = {
        switch entrant.projectNumber {
        case .secondContract?, .thirdContract?, .fifthContract?:
            return true
        default:
            return false
        }
    }()
    lazy var officeAccess: Bool = {
        switch entrant.projectNumber {
        case .thirdContract?, .fourthContract?:
            return true
        default:
            return false
        }
    }()
    var passType = PassType.contractorPass.rawValue
    
    init(entrant: Employee) {
        self.entrant = entrant
    }
}

// vendor pass
class VendorPass: Pass, EmployeeEntrant {

    var entrant: Employee

    var skipRideLines = false
    var foodDiscount = 0
    var merchandiseDiscount = 0
    
    var rideAccess = false
    
    var passDetails = "Pass for vendors"
    
    lazy var amusementAccess: Bool = {
        switch entrant.vendorCompany {
        case .orkin?, .nwElectrical?:
            return true
        default:
            return false
        }
    }()
    lazy var rideControlAccess: Bool = {
        switch entrant.vendorCompany {
        case .orkin?, .nwElectrical?:
            return true
        default:
            return false
        }
    }()
    lazy var kitchenAccess: Bool = {
        switch entrant.vendorCompany {
        case .acme?, .orkin?, .nwElectrical?:
            return true
        default:
            return false
        }
    }()
    lazy var maintenanceAccess: Bool = {
        switch entrant.vendorCompany {
        case .fedex?, .nwElectrical?:
            return true
        default:
            return false
        }
    }()
    lazy var officeAccess: Bool = {
        switch entrant.vendorCompany {
        case .fedex?, .nwElectrical?:
            return true
        default:
            return false
        }
    }()
    var passType = PassType.vendorPass.rawValue
    
    init(entrant: Employee) {
        self.entrant = entrant
    }
}


