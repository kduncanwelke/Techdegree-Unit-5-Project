//
//  Protocols.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/6/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import Foundation

protocol Entrant {
    var firstName: String { get set }
    var lastName: String  { get set }
    var birthday: String?  { get set }
    var streetAddress: String?  { get set }
    var city: String?  { get set }
    var state: String?  { get set }
    var zipCode: Int?  { get set }
    
    //func checkRequirements(entrant: Entrant) throws
    //func isSubmissionErrorFree(entrant: Entrant) -> Bool
}

protocol PassEntrant {
}

protocol GuestEntrant: PassEntrant {
    var entrant: Guest { get set }
}

protocol EmployeeEntrant: PassEntrant {
    var entrant: Employee { get set }
}


