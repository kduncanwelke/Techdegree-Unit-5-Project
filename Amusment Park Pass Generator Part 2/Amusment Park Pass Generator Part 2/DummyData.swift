//
//  DummyData.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/21/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import Foundation

struct DummyData {
    
    static func loadData() -> [Entrant] {
        return [
        Guest(type: .classic, firstName: "A", lastName: "Person", birthday: "", streetAddress: "", city: "", state: "", zipCode: nil), // classic
        Guest(type: .freeChild, firstName: "Child", lastName: "Person", birthday: "19/11/2016", streetAddress: "", city: "", state: "", zipCode: nil), // free child
        Guest(type: .senior, firstName: "Older", lastName: "Person", birthday: "01/01/1950", streetAddress: "", city: "", state: "", zipCode: nil), // senior
        Guest(type: .vip, firstName: "This", lastName: "Human", birthday: "", streetAddress: "", city: "", state: "", zipCode: nil), // VIP
        Guest(type: .seasonPass, firstName: "Someone", lastName: "Somename", birthday: "", streetAddress: "A road somewhere", city: "Somecity", state: "Somestate", zipCode: 46789), // season
        Employee(type: .foodService, firstName: "Ahuman", lastName: "Person", birthday: "", streetAddress: "This road", city: "This city", state: "This state", zipCode: 47536), // food service
        Employee(type: .rideService, firstName: "Somebody", lastName: "Withaname", birthday: "", streetAddress: "A street", city: "A city", state: "A state", zipCode: 63453), // ride service
        Employee(type: .maintenance, firstName: "Thename", lastName: "Somename", birthday: "", streetAddress: "A road somewhere", city: "Someplace", state: "Somestate", zipCode: 42651), //maintenance
        Employee(type: .manager, firstName: "Named", lastName: "This", birthday: "", streetAddress: "This lane", city: "Thiscity", state: "Thisstate", zipCode: 34719), // manager
        Employee(type: .contractEmployee, firstName: "Named", lastName: "Thisname", birthday: "", streetAddress: "Somewhere lane", city: "Inacity", state: "Inastate", zipCode: 19838, vendorCompany: nil, visitDate: nil, projectNumber: .firstContract), // contractor
        Employee(type: .vendor, firstName: "Aperson", lastName: "Withaname", birthday: "10/10/1976", streetAddress: "", city: "", state: "", zipCode: nil, vendorCompany: .fedex, visitDate: "19/11/2018", projectNumber: nil) // vendor
        ]
    }
}
