//
//  Protocols.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/6/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import Foundation

protocol EntrantRegistration {
}

// different implementations for each subclass of entrant

protocol GuestRegistration: EntrantRegistration {
    func checkRequirements(entrant: Guest) throws
    func isSubmissionErrorFree(entrant: Guest) -> Bool
    func generatePass(entrant: Guest) -> Pass?
}

protocol EmployeeRegistration: EntrantRegistration {
    func checkRequirements(entrant: Employee) throws
    func isSubmissionErrorFree(entrant: Employee) -> Bool
    func generatePass(entrant: Employee) -> Pass?
}
