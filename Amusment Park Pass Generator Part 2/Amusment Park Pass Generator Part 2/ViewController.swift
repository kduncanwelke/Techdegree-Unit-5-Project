//
//  ViewController.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/2/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
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
    
    var pass: Pass?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        firstNameEntry.delegate = self
        lastNameEntry.delegate = self
        companyEntry.delegate = self
        addressEntry.delegate = self
        cityEntry.delegate = self
        stateEntry.delegate = self
        
        zipcodeEntry.delegate = self
        projectNumberEntry.delegate = self
        
        // have all fields initially disabled until type is selected
        dobEntry.isEnabled = false
        dateOfVisit.isEnabled = false
        projectNumberEntry.isEnabled = false
        firstNameEntry.isEnabled = false
        lastNameEntry.isEnabled = false
        companyEntry.isEnabled = false
        addressEntry.isEnabled = false
        cityEntry.isEnabled = false
        stateEntry.isEnabled = false
        zipcodeEntry.isEnabled = false
   
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func toggleGuestButtons() {
        dobEntry.isEnabled = false
        dateOfVisit.isEnabled = false
        projectNumberEntry.isEnabled = false
        firstNameEntry.isEnabled = true
        lastNameEntry.isEnabled = true
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
        firstNameEntry.isEnabled = true
        lastNameEntry.isEnabled = true
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
        firstNameEntry.isEnabled = true
        lastNameEntry.isEnabled = true
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
        firstNameEntry.isEnabled = true
        lastNameEntry.isEnabled = true
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
        firstNameEntry.isEnabled = true
        lastNameEntry.isEnabled = true
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
        firstNameEntry.isEnabled = true
        lastNameEntry.isEnabled = true
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
        firstNameEntry.isEnabled = true
        lastNameEntry.isEnabled = true
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
    
    // limit textfield input to 30 characters
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == zipcodeEntry || textField == projectNumberEntry {
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        return updatedText.count <= 30
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
        // change selected button color to light blue
        sender.setTitleColor(UIColor(red: 0.4627, green: 0.8392, blue: 1, alpha: 1.0) /* #76d6ff */, for: .selected)
        
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
    
    @IBAction func generatePassButtonPressed(_ sender: UIButton) {
        guard let firstName = firstNameEntry.text else { return }
        guard let lastName = lastNameEntry.text else { return }
        let dob = dobEntry.text
        let address = addressEntry.text
        let city = cityEntry.text
        let state = stateEntry.text
        let zipCode = Int(zipcodeEntry.text!)
        let company = companyEntry.text
        let visit = dateOfVisit.text
        let number = Int(projectNumberEntry.text!)
        
        if guestButton.isSelected {
            if button1.isSelected {
                let type = Guest.GuestType.classic
                let entrant = Guest(type: type, firstName: firstName, lastName: lastName, birthday: dob, streetAddress: address, city: city, state: state, zipCode: zipCode)
                pass = Kiosk.generatePass(entrant: entrant)
                
                if pass != nil {
                    performSegue(withIdentifier: "viewPass", sender: (Any).self)
                }
            } else if button2.isSelected {
                let type = Guest.GuestType.freeChild
                let entrant = Guest(type: type, firstName: firstName, lastName: lastName, birthday: dob, streetAddress: address, city: city, state: state, zipCode: zipCode)
                pass = Kiosk.generatePass(entrant: entrant)
                
                if pass != nil {
                    performSegue(withIdentifier: "viewPass", sender: (Any).self)
                }
            } else if button3.isSelected {
                let type = Guest.GuestType.senior
                let entrant = Guest(type: type, firstName: firstName, lastName: lastName, birthday: dob, streetAddress: address, city: city, state: state, zipCode: zipCode)
                pass = Kiosk.generatePass(entrant: entrant)
                
                if pass != nil {
                    performSegue(withIdentifier: "viewPass", sender: (Any).self)
                }
            }
        } else if specialButton.isSelected {
            if button1.isSelected {
                let type = Guest.GuestType.vip
                let entrant = Guest(type: type, firstName: firstName, lastName: lastName, birthday: dob, streetAddress: address, city: city, state: state, zipCode: zipCode)
                
                if pass != nil {
                    performSegue(withIdentifier: "viewPass", sender: (Any).self)
                }
                pass = Kiosk.generatePass(entrant: entrant)
            } else if button2.isSelected {
                let type = Guest.GuestType.seasonPass
                let entrant = Guest(type: type, firstName: firstName, lastName: lastName, birthday: dob, streetAddress: address, city: city, state: state, zipCode: zipCode)
                pass = Kiosk.generatePass(entrant: entrant)
                
                if pass != nil {
                    performSegue(withIdentifier: "viewPass", sender: (Any).self)
                }
            }
            
        } else if employeeButton.isSelected {
            if button1.isSelected {
                let type = Employee.EmployeeType.foodService
                let entrant = Employee(type: type, firstName: firstName, lastName: lastName, birthday: dob, streetAddress: address, city: city, state: state, zipCode: zipCode)
                pass = Kiosk.generatePass(entrant: entrant)
                
                if pass != nil {
                    performSegue(withIdentifier: "viewPass", sender: (Any).self)
                }
            } else if button2.isSelected {
                let type = Employee.EmployeeType.rideService
                let entrant = Employee(type: type, firstName: firstName, lastName: lastName, birthday: dob, streetAddress: address, city: city, state: state, zipCode: zipCode)
                pass = Kiosk.generatePass(entrant: entrant)
                
                if pass != nil {
                    performSegue(withIdentifier: "viewPass", sender: (Any).self)
                }
            } else if button3.isSelected {
                let type = Employee.EmployeeType.maintenance
                let entrant = Employee(type: type, firstName: firstName, lastName: lastName, birthday: dob, streetAddress: address, city: city, state: state, zipCode: zipCode)
                pass = Kiosk.generatePass(entrant: entrant)
                
                if pass != nil {
                    performSegue(withIdentifier: "viewPass", sender: (Any).self)
                }
            } else if button4.isSelected {
                let type = Employee.EmployeeType.manager
                let entrant = Employee(type: type, firstName: firstName, lastName: lastName, birthday: dob, streetAddress: address, city: city, state: state, zipCode: zipCode)
                pass = Kiosk.generatePass(entrant: entrant)
                
                if pass != nil {
                    performSegue(withIdentifier: "viewPass", sender: (Any).self)
                }
            }
        } else if servicesButton.isSelected {
            if button1.isSelected {
                let type = Employee.EmployeeType.contractEmployee
                let entrant = Employee(type: type, firstName: firstName, lastName: lastName, birthday: dob, streetAddress: address, city: city, state: state, zipCode: zipCode, vendorCompany: VendorCompanies(rawValue: company!), visitDate: visit, projectNumber: ContractEmployeeProjectNumbers(rawValue: number!))
                pass = Kiosk.generatePass(entrant: entrant)
                
                if pass != nil {
                    performSegue(withIdentifier: "viewPass", sender: (Any).self)
                }
            } else if button2.isSelected {
                let type = Employee.EmployeeType.vendor
                let entrant = Employee(type: type, firstName: firstName, lastName: lastName, birthday: dob, streetAddress: address, city: city, state: state, zipCode: zipCode, vendorCompany: VendorCompanies(rawValue: company!), visitDate: visit, projectNumber: ContractEmployeeProjectNumbers(rawValue: number!))
                pass = Kiosk.generatePass(entrant: entrant)
                
                if pass != nil {
                    performSegue(withIdentifier: "viewPass", sender: (Any).self)
                }
            }
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
            } else if button2.isSelected { // season pass
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
                guard let contractor = data as? Employee else { return }
                firstNameEntry.text = contractor.firstName
                lastNameEntry.text = contractor.lastName
                
                if let address = contractor.streetAddress, let city = contractor.city, let state = contractor.state, let zip = contractor.zipCode, let projectNumber = contractor.projectNumber {
                    addressEntry.text = address
                    cityEntry.text = city
                    stateEntry.text = state
                    zipcodeEntry.text = String(describing: zip)
                    projectNumberEntry.text = String(describing: projectNumber.rawValue)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is PassViewController {
            let destinationViewController = segue.destination as? PassViewController
            destinationViewController?.createdPass = pass
            print("segue called")
        }
    }
    
}

