//
//  Pass.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/2/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import Foundation

// classic pass, base
class Pass {
    var rideAccess: Bool { return true }
    var amusementAccess: Bool { return true }
    var skipRideLines: Bool { return false }
    var kitchenAccess: Bool { return false }
    var rideControlAccess: Bool { return false }
    var maintenanceAccess: Bool { return false }
    var officeAccess: Bool { return false }
    var foodDiscount: Int { return 0 }
    var merchandiseDiscount: Int { return 0 }
    
    var passType: String { return PassType.ClassicPass.rawValue }
}

// classic pass
class ClassicPass: Pass, GuestEntrant  {
    var entrant: Guest
    
    init(entrant: Guest) {
        self.entrant = entrant
    }
}

// VIP pass
class VipPass: Pass, GuestEntrant {
    var entrant: Guest
    
    override var skipRideLines: Bool { return true }
    override var foodDiscount: Int { return 10 }
    override var merchandiseDiscount: Int { return 20 }
    override var passType: String { return PassType.VIPPass.rawValue }
    
    init(entrant: Guest) {
        self.entrant = entrant
    }
}

// free child pass
class FreeChildPass: Pass, GuestEntrant {
    var entrant: Guest
    
    override var passType: String { return PassType.FreeChildPass.rawValue }
    
    init(entrant: Guest) {
        self.entrant = entrant
    }
}

// season guest pass
class SeasonPass: Pass, GuestEntrant {
    var entrant: Guest
    
    override var skipRideLines: Bool { return true }
    override var foodDiscount: Int { return 10 }
    override var merchandiseDiscount: Int { return 20 }
    override var passType: String { return PassType.SeasonPass.rawValue }
    
    init(entrant: Guest) {
        self.entrant = entrant
    }
}

// senior pass
class SeniorPass: Pass, GuestEntrant {
    var entrant: Guest
    
    override var skipRideLines: Bool { return true }
    override var foodDiscount: Int { return 10 }
    override var merchandiseDiscount: Int { return 10 }
    override var passType: String { return PassType.SeniorPass.rawValue }
    
    init(entrant: Guest) {
        self.entrant = entrant
    }
}

// food services employee pass
class FoodServicePass: Pass, EmployeeEntrant {
    var entrant: Employee
    
    override var kitchenAccess: Bool { return true }
    override var foodDiscount: Int { return 15 }
    override var merchandiseDiscount: Int { return 25 }
    override var passType: String { return PassType.FoodServicePass.rawValue }
    
    init(entrant: Employee) {
        self.entrant = entrant
    }
}

// ride services employee pass
class RideServicesPass: Pass, EmployeeEntrant {
    var entrant: Employee
    
    override var rideControlAccess: Bool { return true }
    override var foodDiscount: Int { return 15 }
    override var merchandiseDiscount: Int { return 25 }
    override var passType: String { return PassType.RideServicePass.rawValue }
    
    init(entrant: Employee) {
        self.entrant = entrant
    }
}

// maintenance employee pass
class MaintenancePass: Pass, EmployeeEntrant {
    var entrant: Employee
    
    override var kitchenAccess: Bool { return true }
    override var rideControlAccess: Bool { return true }
    override var maintenanceAccess: Bool { return true }
    override var foodDiscount: Int { return 15 }
    override var merchandiseDiscount: Int { return 25 }
    override var passType: String { return PassType.MaintenancePass.rawValue }
    
    init(entrant: Employee) {
        self.entrant = entrant
    }
}

// manager pass
class ManagerPass: Pass, EmployeeEntrant {
    var entrant: Employee
    
    override var officeAccess: Bool { return true }
    override var kitchenAccess: Bool { return true }
    override var rideControlAccess: Bool { return true }
    override var maintenanceAccess: Bool { return true }
    override var foodDiscount: Int { return 25 }
    override var merchandiseDiscount: Int { return 25 }
    override var passType: String { return PassType.ManagerPass.rawValue }
    
    init(entrant: Employee) {
        self.entrant = entrant
    }
}

// contract employee pass
class ContractPass: Pass, EmployeeEntrant {
    var entrant: Employee
    
    override var rideAccess: Bool { return false }
    
    override var amusementAccess: Bool {
        switch entrant.projectNumber {
        case .FirstContract?, .SecondContract?, .ThirdContract?:
            return true
        default:
            return false
        }
    }
    override var rideControlAccess: Bool {
        switch entrant.projectNumber {
        case .FirstContract?, .SecondContract?, .ThirdContract?:
            return true
        default:
            return false
        }
    }
    override var kitchenAccess: Bool {
        switch entrant.projectNumber {
        case .ThirdContract?, .FifthContract?:
            return true
        default:
            return false
        }
    }
    override var maintenanceAccess: Bool {
        switch entrant.projectNumber {
        case .SecondContract?, .ThirdContract?, .FifthContract?:
            return true
        default:
            return false
        }
    }
    override var officeAccess: Bool {
        switch entrant.projectNumber {
        case .ThirdContract?, .FourthContract?:
            return true
        default:
            return false
        }
    }
    override var passType: String { return PassType.ContractorPass.rawValue }
    
    init(entrant: Employee) {
        self.entrant = entrant
    }
}

// vendor pass
class VendorPass: Pass, EmployeeEntrant {
    var entrant: Employee
    
    override var rideAccess: Bool { return false }
    
    override var amusementAccess: Bool {
        switch entrant.vendorCompany {
        case .Orkin?, .NWElectrical?:
            return true
        default:
            return false
        }
    }
    override var rideControlAccess: Bool {
        switch entrant.vendorCompany {
        case .Orkin?, .NWElectrical?:
            return true
        default:
            return false
        }
    }
    override var kitchenAccess: Bool {
        switch entrant.vendorCompany {
        case .Acme?, .Orkin?, .NWElectrical?:
            return true
        default:
            return false
        }
    }
    override var maintenanceAccess: Bool {
        switch entrant.vendorCompany {
        case .Fedex?, .NWElectrical?:
            return true
        default:
            return false
        }
    }
    override var officeAccess: Bool {
        switch entrant.vendorCompany {
        case .Fedex?, .NWElectrical?:
            return true
        default:
            return false
        }
    }
    override var passType: String { return PassType.VendorPass.rawValue }
    
    init(entrant: Employee) {
        self.entrant = entrant
    }
}


