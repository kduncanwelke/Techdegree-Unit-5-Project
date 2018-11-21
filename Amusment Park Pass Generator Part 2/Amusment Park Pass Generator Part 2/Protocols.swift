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
}

// different implementations for each class
protocol EntrantRegistration {
}

protocol GuestRegistration: EntrantRegistration {
    func checkRequirements(entrant: Guest) throws
    func isSubmissionErrorFree(entrant: Guest) -> Bool
    //func generatePass(entrant: Guest) -> Pass?
}

protocol EmployeeRegistration: EntrantRegistration {
    func checkRequirements(entrant: Employee) throws
    func isSubmissionErrorFree(entrant: Employee) -> Bool
    //func generatePass(entrant: Employee) -> Pass?
}

protocol PassEntrant {
}

protocol GuestEntrant: PassEntrant {
    var entrant: Guest { get set }
}

protocol EmployeeEntrant: PassEntrant {
    var entrant: Employee { get set }
}


