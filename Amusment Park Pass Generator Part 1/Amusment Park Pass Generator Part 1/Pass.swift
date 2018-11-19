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
    let entrant: Entrant
    
    let rideAccess = true
    let amusementAccess = true
    var skipRideLines: Bool { return false }
    var kitchenAccess: Bool { return false }
    var rideControlAccess: Bool { return false }
    var maintenanceAccess: Bool { return false }
    var officeAccess: Bool { return false }
    var foodDiscount: Int { return 0 }
    var merchandiseDiscount: Int { return 0 }
    
    var passType: String { return PassType.ClassicPass.rawValue }
    
    init(entrant: Entrant) {
        self.entrant = entrant
    }
}

// VIP pass
class VipPass: Pass {
    override var skipRideLines: Bool { return true }
    override var foodDiscount: Int { return 10 }
    override var merchandiseDiscount: Int { return 20 }
    override var passType: String { return PassType.VIPPass.rawValue }
}

// free child pass
class FreeChildPass: Pass {
     override var passType: String { return PassType.FreeChildPass.rawValue }
}

// food services employee pass
class FoodServicePass: Pass {
    override var kitchenAccess: Bool { return true }
    override var foodDiscount: Int { return 15 }
    override var merchandiseDiscount: Int { return 25 }
    override var passType: String { return PassType.FoodServicePass.rawValue }
}

// ride services employee pass
class RideServicesPass: Pass {
    override var rideControlAccess: Bool { return true }
    override var foodDiscount: Int { return 15 }
    override var merchandiseDiscount: Int { return 25 }
    override var passType: String { return PassType.RideServicePass.rawValue }
}

// maintenance employee pass
class MaintenancePass: Pass {
    override var kitchenAccess: Bool { return true }
    override var rideControlAccess: Bool { return true }
    override var maintenanceAccess: Bool { return true }
    override var foodDiscount: Int { return 15 }
    override var merchandiseDiscount: Int { return 25 }
    override var passType: String { return PassType.MaintenancePass.rawValue }
}

// manager pass
class ManagerPass: Pass {
    override var officeAccess: Bool { return true }
    override var kitchenAccess: Bool { return true }
    override var rideControlAccess: Bool { return true }
    override var maintenanceAccess: Bool { return true }
    override var foodDiscount: Int { return 25 }
    override var merchandiseDiscount: Int { return 25 }
    override var passType: String { return PassType.ManagerPass.rawValue }
}


