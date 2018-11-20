//
//  ViewController.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/2/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var dobEntry: UITextField!
    @IBOutlet weak var ssnEntry: UITextField!
    @IBOutlet weak var projectNumberEntry: UITextField!
    
    @IBOutlet weak var firstNameEntry: UITextField!
    @IBOutlet weak var lastNameEntry: UITextField!
    
    @IBOutlet weak var companyEntry: UITextField!
    
    @IBOutlet weak var addressEntry: UITextField!
    @IBOutlet weak var cityEntry: UITextField!
    @IBOutlet weak var stateEntry: UITextField!
    @IBOutlet weak var zipcodeEntry: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let ClassicDefaultValues = Guest(type: .Classic, firstName: "A", lastName: "Person", birthday: "", streetAddress: "", city: "", state: "", zipCode: nil)
        
        let VIPDefaultValues = Guest(type: .Vip, firstName: "This", lastName: "Human", birthday: "", streetAddress: "", city: "", state: "", zipCode: nil)
        
        let FreeChildDefaultValues = Guest(type: .FreeChild, firstName: "Child", lastName: "Person", birthday: "19/11/2016", streetAddress: "", city: "", state: "", zipCode: nil)
        
        let SeasonDefaultValues = Guest(type: .SeasonPass, firstName: "Someone", lastName: "Somename", birthday: "", streetAddress: "A road somewhere", city: "Somecity", state: "Somestate", zipCode: 46789)
        
        let SeniorDefaultValues = Guest(type: .Senior, firstName: "Older", lastName: "Person", birthday: "01/01/1950", streetAddress: "", city: "", state: "", zipCode: nil)
        
        
        let FoodServiceDefaultValues = Employee(type: .FoodService, firstName: "Ahuman", lastName: "Person", birthday: "", streetAddress: "This road", city: "This city", state: "This state", zipCode: 47536)
        
        let RideServiceDefaultValues = Employee(type: .RideService, firstName: "Somebody", lastName: "Withaname", birthday: "", streetAddress: "A street", city: "A city", state: "A state", zipCode: 63453)
        
        let MaintenanceDefaultValues = Employee(type: .Maintenance, firstName: "Thename", lastName: "Somename", birthday: "", streetAddress: "A road somewhere", city: "Someplace", state: "Somestate", zipCode: 42651)
        
        let ManagerDefaultValues = Employee(type: .Manager, firstName: "Named", lastName: "This", birthday: "", streetAddress: "This lane", city: "Thiscity", state: "Thisstate", zipCode: 34719)
        
        let ContractEmployeeDefaultValues = Employee(type: .ContractEmployee, firstName: "Named", lastName: "Thisname", birthday: "", streetAddress: "Somewhere lane", city: "Inacity", state: "Inastate", zipCode: 19838, vendorCompany: nil, visitDate: nil, projectNumber: .FirstContract)
        
        let VendorDefaultValues = Employee(type: .Vendor, firstName: "Aperson", lastName: "Withaname", birthday: "10/10/1976", streetAddress: "", city: "", state: "", zipCode: nil, vendorCompany: .Fedex, visitDate: "19/11/2018", projectNumber: nil)
        
        
        // Uncomment or comment out individual swipe actions to see results
        /*let person1 = Guest(type: .Classic, firstName: "jg", lastName: "gkg", birthday: "", streetAddress: "", city: "", state: "", zipCode: nil)
        // let person1 = Guest(type: .Classic, firstName: "", lastName: "Name", birthday: nil, streetAddress: )
        let pass1 = person1.generatePass(entrant: person1)
        if let pass1 = pass1 {
            Kiosk.swipe(pass: pass1, forAccessTo: .Office)
            // Kiosk.swipe(pass: pass1, forAccessTo: .Rides)
            // Kiosk.swipe(pass: pass1, forAccessTo: .Amusements)
        }*/
        
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
    
    @IBAction func guestButtonPressed(_ sender: UIButton) {
        button1.setTitle("Classic", for: .normal)
        button2.setTitle("Child", for: .normal)
        button3.setTitle("Season", for: .normal)
        button3.isHidden = false
        button4.isHidden = true
    }
    
    @IBAction func specialButtonPressed(_ sender: UIButton) {
        button1.setTitle("VIP", for: .normal)
        button2.setTitle("Season Pass", for: .normal)
        button3.isHidden = true
        button4.isHidden = true
    }
    
    @IBAction func employeeButtonPressed(_ sender: UIButton) {
        button1.setTitle("Food Services", for: .normal)
        button2.setTitle("Ride Services", for: .normal)
        button3.setTitle("Maintenance", for: .normal)
        button4.setTitle("Manager", for: .normal)
        button3.isHidden = false
        button4.isHidden = false
    }
    
    @IBAction func servicesButtonPressed(_ sender: UIButton) {
        button1.setTitle("Contractor", for: .normal)
        button2.setTitle("Vendor", for: .normal)
        button3.isHidden = true
        button4.isHidden = true
    }
    
    @IBAction func populateDateButtonPressed(_ sender: Any) {
        
    }
    
}

