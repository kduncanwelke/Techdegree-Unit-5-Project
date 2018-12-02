//
//  DummyData.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/21/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import Foundation


// default data
struct DummyData {
    
    static let defaultClassic = Guest(type: .classic, firstName: "A", lastName: "Person", birthday: "", streetAddress: "", city: "", state: "", zipCode: nil)
    
    static let defaultFreeChild = Guest(type: .freeChild, firstName: "Child", lastName: "Person", birthday: "19/11/2016", streetAddress: "", city: "", state: "", zipCode: nil)
    
    static let defaultSenior = Guest(type: .senior, firstName: "Older", lastName: "Person", birthday: "01/01/1950", streetAddress: "", city: "", state: "", zipCode: nil)
    
    static let defaultVip = Guest(type: .vip, firstName: "This", lastName: "Human", birthday: "", streetAddress: "", city: "", state: "", zipCode: nil)
    
    static let defaultSeason = Guest(type: .seasonPass, firstName: "Someone", lastName: "Somename", birthday: "", streetAddress: "A road somewhere", city: "Somecity", state: "Somestate", zipCode: 46789)
    
    static let defaultFoodService = Employee(type: .foodService, firstName: "Ahuman", lastName: "Person", birthday: "", streetAddress: "This road", city: "This city", state: "This state", zipCode: 47536)
    
    static let defaultRideService = Employee(type: .rideService, firstName: "Somebody", lastName: "Withaname", birthday: "", streetAddress: "A street", city: "A city", state: "A state", zipCode: 63453)
    
    static let defaultMaintenance = Employee(type: .maintenance, firstName: "Thename", lastName: "Somename", birthday: "", streetAddress: "A road somewhere", city: "Someplace", state: "Somestate", zipCode: 42651)
    
    static let defaultManager = Employee(type: .manager, firstName: "Named", lastName: "This", birthday: "", streetAddress: "This lane", city: "Thiscity", state: "Thisstate", zipCode: 34719)
    
    static let defaultContract = Employee(type: .contractEmployee, firstName: "Named", lastName: "Thisname", birthday: "", streetAddress: "Somewhere lane", city: "Inacity", state: "Inastate", zipCode: 19838, vendorCompany: nil, visitDate: nil, projectNumber: .firstContract)
    
    static let defaultVendor = Employee(type: .vendor, firstName: "Aperson", lastName: "Withaname", birthday: "10/10/1976", streetAddress: "", city: "", state: "", zipCode: nil, vendorCompany: .fedex, visitDate: "19/11/2018", projectNumber: nil)
}
