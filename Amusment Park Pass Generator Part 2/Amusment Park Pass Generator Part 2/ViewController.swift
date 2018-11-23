//
//  ViewController.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/2/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var guestButton: UIButton!
    @IBOutlet weak var specialButton: UIButton!
    @IBOutlet weak var employeeButton: UIButton!
    @IBOutlet weak var servicesButton: UIButton!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var dobEntry: UITextField!
    @IBOutlet weak var dateOfVisit: UITextField!
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
    
    
    func toggleGuestButtons() {
        dobEntry.isEnabled = false
        dateOfVisit.isEnabled = false
        projectNumberEntry.isEnabled = false
        companyEntry.isEnabled = false
        addressEntry.isEnabled = false
        cityEntry.isEnabled = false
        stateEntry.isEnabled = false
        zipcodeEntry.isEnabled = false
    }
    
    func toggleChildButtons() {
        dobEntry.isEnabled = true
        dateOfVisit.isEnabled = false
        projectNumberEntry.isEnabled = false
        companyEntry.isEnabled = false
        addressEntry.isEnabled = false
        cityEntry.isEnabled = false
        stateEntry.isEnabled = false
        zipcodeEntry.isEnabled = false
    }
    
    func toggleSeasonButtons() {
        dobEntry.isEnabled = false
        dateOfVisit.isEnabled = false
        projectNumberEntry.isEnabled = false
        companyEntry.isEnabled = false
        addressEntry.isEnabled = true
        cityEntry.isEnabled = true
        stateEntry.isEnabled = true
        zipcodeEntry.isEnabled = true
    }
    
    func toggleSeniorButtons() {
        dobEntry.isEnabled = true
        dateOfVisit.isEnabled = false
        projectNumberEntry.isEnabled = false
        companyEntry.isEnabled = false
        addressEntry.isEnabled = false
        cityEntry.isEnabled = false
        stateEntry.isEnabled = false
        zipcodeEntry.isEnabled = false
    }
    
    func toggleEmployeeButtons() {
        dobEntry.isEnabled = false
        dateOfVisit.isEnabled = false
        projectNumberEntry.isEnabled = false
        companyEntry.isEnabled = false
        addressEntry.isEnabled = true
        cityEntry.isEnabled = true
        stateEntry.isEnabled = true
        zipcodeEntry.isEnabled = true
    }
    
    func toggleContractorButtons() {
        dobEntry.isEnabled = false
        dateOfVisit.isEnabled = false
        projectNumberEntry.isEnabled = true
        companyEntry.isEnabled = false
        addressEntry.isEnabled = true
        cityEntry.isEnabled = true
        stateEntry.isEnabled = true
        zipcodeEntry.isEnabled = true
    }
    
    func toggleVendorButtons() {
        dobEntry.isEnabled = true
        dateOfVisit.isEnabled = true
        projectNumberEntry.isEnabled = false
        companyEntry.isEnabled = true
        addressEntry.isEnabled = false
        cityEntry.isEnabled = false
        stateEntry.isEnabled = false
        zipcodeEntry.isEnabled = false
    }
    
    func resetFields() {
        dobEntry.text = ""
        dateOfVisit.text = ""
        projectNumberEntry.text = ""
        firstNameEntry.text = ""
        lastNameEntry.text = ""
        companyEntry.text = ""
        addressEntry.text = ""
        cityEntry.text = ""
        stateEntry.text = ""
        zipcodeEntry.text = ""
    }
    
    @IBAction func selectType(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            button4.isHidden = true
           
            guestButton.isSelected = true
            guestButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            
            specialButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            employeeButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            servicesButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            
            specialButton.isSelected = false
            employeeButton.isSelected = false
            servicesButton.isSelected = false
            
            button1.setTitle("Classic", for: .normal)
            button2.setTitle("Child", for: .normal)
            button3.setTitle("Senior", for: .normal)
            
            button3.isHidden = false
            
            resetFields()
        case 2:
            button3.isHidden = true
            button4.isHidden = true
            
            specialButton.isSelected = true
            specialButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            
            guestButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            employeeButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            servicesButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            
            guestButton.isSelected = false
            employeeButton.isSelected = false
            servicesButton.isSelected = false
            
            button1.setTitle("VIP", for: .normal)
            button2.setTitle("Season Pass", for: .normal)
            
            resetFields()
        case 3:
            employeeButton.isSelected = true
            employeeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            
            specialButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            guestButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            servicesButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            
            specialButton.isSelected = false
            guestButton.isSelected = false
            servicesButton.isSelected = false
            
            button1.setTitle("Food Services", for: .normal)
            button2.setTitle("Ride Services", for: .normal)
            button3.setTitle("Maintenance", for: .normal)
            button4.setTitle("Manager", for: .normal)
            
            button3.isHidden = false
            button4.isHidden = false
            
            resetFields()
        case 4:
            button3.isHidden = true
            button4.isHidden = true
            
            servicesButton.isSelected = true
            servicesButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            
            specialButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            employeeButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            guestButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            
            specialButton.isSelected = false
            employeeButton.isSelected = false
            guestButton.isSelected = false
            
            button1.setTitle("Contractor", for: .normal)
            button2.setTitle("Vendor", for: .normal)
            
            resetFields()
        default:
            break
        }
    }
    
    
    @IBAction func selectPass(_ sender: UIButton) {
        switch sender.tag {
        case 5:
            button1.isSelected = true
            button2.isSelected = false
            button3.isSelected = false
            button4.isSelected = false
            
            if guestButton.isSelected || specialButton.isSelected {
                toggleGuestButtons()
            } else if employeeButton.isSelected {
                toggleEmployeeButtons()
            } else if servicesButton.isSelected {
                toggleContractorButtons()
            }
            
            resetFields()
        case 6:
            button1.isSelected = false
            button2.isSelected = true
            button3.isSelected = false
            button4.isSelected = false
            
            if guestButton.isSelected {
                toggleChildButtons()
            } else if specialButton.isSelected {
                toggleSeasonButtons()
            } else if employeeButton.isSelected {
                toggleEmployeeButtons()
            } else if servicesButton.isSelected {
                toggleVendorButtons()
            }
        
            resetFields()
        case 7:
            button1.isSelected = false
            button2.isSelected = false
            button3.isSelected = true
            button4.isSelected = false
            
            if guestButton.isSelected {
                toggleSeniorButtons()
            } else if employeeButton.isSelected {
                toggleEmployeeButtons()
            }
            
            resetFields()
        case 8:
            button1.isSelected = false
            button2.isSelected = false
            button3.isSelected = false
            button4.isSelected = true
            
            if employeeButton.isSelected {
                toggleEmployeeButtons()
            }
            resetFields()
        default:
            break
        }
    }
    
   
    @IBAction func populateDateButtonPressed(_ sender: Any) {
        let dataList = DummyData.loadData()
        if guestButton.isSelected {
            if button1.isSelected { // classic
                let data = dataList[0]
                firstNameEntry.text = data.firstName
                lastNameEntry.text = data.lastName
            } else if button2.isSelected { // free child
                let data = dataList[1]
                firstNameEntry.text = data.firstName
                lastNameEntry.text = data.lastName
                if let dob = data.birthday {
                    dobEntry.text = dob
                }
            } else if button3.isSelected { // senior
                let data = dataList[2]
                firstNameEntry.text = data.firstName
                lastNameEntry.text = data.lastName
                
                if let dob = data.birthday {
                    dobEntry.text = dob
                }
            }
        } else if specialButton.isSelected {
            if button1.isSelected { // vip
                let data = dataList[3]
                firstNameEntry.text = data.firstName
                lastNameEntry.text = data.lastName
            } else if button2.isSelected {
                let data = dataList[4]
                firstNameEntry.text = data.firstName
                lastNameEntry.text = data.lastName
                
                if let address = data.streetAddress, let city = data.city, let state = data.state, let zip = data.zipCode {
                    addressEntry.text = address
                    cityEntry.text = city
                    stateEntry.text = state
                    zipcodeEntry.text = String(describing: zip)
                }
            }
        } else if employeeButton.isSelected {
            if button1.isSelected { // food service
                let data = dataList[5]
                firstNameEntry.text = data.firstName
                lastNameEntry.text = data.lastName
                
                if let address = data.streetAddress, let city = data.city, let state = data.state, let zip = data.zipCode {
                    addressEntry.text = address
                    cityEntry.text = city
                    stateEntry.text = state
                    zipcodeEntry.text = String(describing: zip)
                }
            } else if button2.isSelected { // ride service
                let data = dataList[6]
                firstNameEntry.text = data.firstName
                lastNameEntry.text = data.lastName
                
                if let address = data.streetAddress, let city = data.city, let state = data.state, let zip = data.zipCode {
                    addressEntry.text = address
                    cityEntry.text = city
                    stateEntry.text = state
                    zipcodeEntry.text = String(describing: zip)
                }
            } else if button3.isSelected { // maintenance
                let data = dataList[7]
                firstNameEntry.text = data.firstName
                lastNameEntry.text = data.lastName
                
                if let address = data.streetAddress, let city = data.city, let state = data.state, let zip = data.zipCode {
                    addressEntry.text = address
                    cityEntry.text = city
                    stateEntry.text = state
                    zipcodeEntry.text = String(describing: zip)
                }
            }
            if button4.isSelected { // manager
                let data = dataList[8]
                firstNameEntry.text = data.firstName
                lastNameEntry.text = data.lastName
                
                if let address = data.streetAddress, let city = data.city, let state = data.state, let zip = data.zipCode {
                    addressEntry.text = address
                    cityEntry.text = city
                    stateEntry.text = state
                    zipcodeEntry.text = String(describing: zip)
                }
            }
        } else if servicesButton.isSelected {
            if button1.isSelected { // contract employee
                let data = dataList[9]
                firstNameEntry.text = data.firstName
                lastNameEntry.text = data.lastName
                
                if let address = data.streetAddress, let city = data.city, let state = data.state, let zip = data.zipCode {
                    addressEntry.text = address
                    cityEntry.text = city
                    stateEntry.text = state
                    zipcodeEntry.text = String(describing: zip)
                }
            } else if button2.isSelected { // vendor
                let data = dataList[10]
                guard let vendor = data as? Employee else { return }
                firstNameEntry.text = vendor.firstName
                lastNameEntry.text = vendor.lastName
                
                if let company = vendor.vendorCompany, let dob = vendor.birthday, let visit = vendor.visitDate {
                    companyEntry.text = company.rawValue
                    dobEntry.text = dob
                    dateOfVisit.text = visit
                    
                    print("\(company.rawValue)")
                }
            }
        }
    }
    
}

