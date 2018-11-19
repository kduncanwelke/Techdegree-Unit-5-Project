//
//  ViewController.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/2/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Uncomment or comment out individual swipe actions to see results
      
        /*
        let person1 = Guest(type: .Classic, firstName: "", lastName: "Name", birthday: nil)
        let pass1 = person1.generatePass(entrant: person1)
        if let pass1 = pass1 {
            Kiosk.swipe(pass: pass1, forAccessTo: .Office)
            // Kiosk.swipe(pass: pass1, forAccessTo: .Rides)
            // Kiosk.swipe(pass: pass1, forAccessTo: .Amusements)
        }
        */
        
        /*
        let person2 = Guest(type: .Vip, firstName: "Fancy", lastName: "Person", birthday: nil)
        let pass2 = person2.generatePass(entrant: person2)
        if let pass2 = pass2 {
            Kiosk.swipe(pass: pass2, forAccessTo: .Rides)
            // Kiosk.swipe(pass: pass2, forAccessTo: .FoodDiscount)
            // Kiosk.swipe(pass: pass2, forAccessTo: .SkipLines)
        }
        */
        
        /*
        let person3 = Guest(type: .FreeChild, firstName: "A", lastName: "Child", birthday: "12/11/2016")
        let pass3 = person3.generatePass(entrant: person3)
        if let pass3 = pass3 {
           Kiosk.swipe(pass: pass3, forAccessTo: .Kitchen)
           // Kiosk.swipe(pass: pass3, forAccessTo: .Amusements)
           // Kiosk.swipe(pass: pass3, forAccessTo: .Rides)
        }
        */
    
        /*
        let person4 = Employee(type: .FoodService, streetAddress: "Somewhere Street", city: "A City", state: "", zipCode: 47556, firstName: "A", lastName: "Person", birthday: nil)
        let pass4 = person4.generatePass(entrant: person4)
        if let pass4 = pass4 {
            Kiosk.swipe(pass: pass4, forAccessTo: .Amusements)
            // Kiosk.swipe(pass: pass4, forAccessTo: .MerchDiscount)
            // Kiosk.swipe(pass: pass4, forAccessTo: .Kitchen)
        }
        */
        
        /*
        let person5 = Employee(type: .RideService, streetAddress: "", city: "Somewhereville", state: "State", zipCode: 46974, firstName: "Person", lastName: "Person", birthday: nil)
        let pass5 = person5.generatePass(entrant: person5)
        if let pass5 = pass5 {
            Kiosk.swipe(pass: pass5, forAccessTo: .Amusements)
            // Kiosk.swipe(pass: pass5, forAccessTo: .RideControl)
            // Kiosk.swipe(pass: pass5, forAccessTo: .Rides)
        }
        */
        
        /*
        let person6 = Employee(type: .Maintenance, streetAddress: "A Road", city: "Some City", state: "A State", zipCode: 87756, firstName: "This", lastName: "Person", birthday: nil)
        let pass6 = person6.generatePass(entrant: person6)
        if let pass6 = pass6 {
            // Kiosk.swipe(pass: pass6, forAccessTo: .Maintenance)
         // The below tests thet pass cannot be swiped again
            Kiosk.swipe(pass: pass6, forAccessTo: .MerchDiscount)
            Kiosk.swipe(pass: pass6, forAccessTo: .MerchDiscount)
        }
        */
 
        /*
        let person7 = Employee(type: .Manager, streetAddress: "This Street", city: "This City", state: "This State", zipCode: 38865, firstName: "The", lastName: "Manager", birthday: nil)
        let pass7 = person7.generatePass(entrant: person7)
        if let pass7 = pass7 {
            Kiosk.swipe(pass: pass7, forAccessTo: .Office)
           // Kiosk.swipe(pass: pass7, forAccessTo: .FoodDiscount)
           // Kiosk.swipe(pass: pass7, forAccessTo: .RideControl)
        }
        */

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

