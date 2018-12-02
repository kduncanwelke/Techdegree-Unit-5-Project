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
    
    // functions to toggle required fields
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
    
    // change display of subset of pass types based on entrant type chosen
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
        
        // based on selected buttons, toggle buttons for each pass input type
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
        // use fields to generate input for entrants
        guard let firstName = firstNameEntry.text else { return }
        guard let lastName = lastNameEntry.text else { return }
        let dob = dobEntry.text
        let address = addressEntry.text
        let city = cityEntry.text
        let state = stateEntry.text
        let zipCode: Int? = Int(zipcodeEntry.text!)
        let visit = dateOfVisit.text
    
        var entrant: Entrant?
        
        // assign types to entrant based on selected buttons, initialize entrants
        if guestButton.isSelected {
            if button1.isSelected {
                let type = Guest.GuestType.classic
                entrant = Guest(type: type, firstName: firstName, lastName: lastName, birthday: dob, streetAddress: address, city: city, state: state, zipCode: zipCode)
            } else if button2.isSelected {
                let type = Guest.GuestType.freeChild
                entrant = Guest(type: type, firstName: firstName, lastName: lastName, birthday: dob, streetAddress: address, city: city, state: state, zipCode: zipCode)
            } else if button3.isSelected {
                let type = Guest.GuestType.senior
                entrant = Guest(type: type, firstName: firstName, lastName: lastName, birthday: dob, streetAddress: address, city: city, state: state, zipCode: zipCode)
            }
        } else if specialButton.isSelected {
            if button1.isSelected {
                let type = Guest.GuestType.vip
                entrant = Guest(type: type, firstName: firstName, lastName: lastName, birthday: dob, streetAddress: address, city: city, state: state, zipCode: zipCode)
            } else if button2.isSelected {
                let type = Guest.GuestType.seasonPass
                entrant = Guest(type: type, firstName: firstName, lastName: lastName, birthday: dob, streetAddress: address, city: city, state: state, zipCode: zipCode)
            }
        } else if employeeButton.isSelected {
            if button1.isSelected {
                let type = Employee.EmployeeType.foodService
                entrant = Employee(type: type, firstName: firstName, lastName: lastName, birthday: dob, streetAddress: address, city: city, state: state, zipCode: zipCode)
            } else if button2.isSelected {
                let type = Employee.EmployeeType.rideService
                entrant = Employee(type: type, firstName: firstName, lastName: lastName, birthday: dob, streetAddress: address, city: city, state: state, zipCode: zipCode)
            } else if button3.isSelected {
                let type = Employee.EmployeeType.maintenance
                entrant = Employee(type: type, firstName: firstName, lastName: lastName, birthday: dob, streetAddress: address, city: city, state: state, zipCode: zipCode)
            } else if button4.isSelected {
                let type = Employee.EmployeeType.manager
                entrant = Employee(type: type, firstName: firstName, lastName: lastName, birthday: dob, streetAddress: address, city: city, state: state, zipCode: zipCode)
            }
        } else if servicesButton.isSelected {
            if button1.isSelected {
                let type = Employee.EmployeeType.contractEmployee
                guard let contractNumber = projectNumberEntry.text else { return }
                
                if let number = Int(contractNumber), let project = ContractEmployeeProjectNumbers(rawValue: number) {
                
                entrant = Employee(type: type, firstName: firstName, lastName: lastName, birthday: dob, streetAddress: address, city: city, state: state, zipCode: zipCode, vendorCompany: nil, visitDate: visit, projectNumber: project)
                } else {
                    // add condition for possible nil to ensure failure
                    let number: ContractEmployeeProjectNumbers? = nil
                    entrant = Employee(type: type, firstName: firstName, lastName: lastName, birthday: dob, streetAddress: address, city: city, state: state, zipCode: zipCode, vendorCompany: nil, visitDate: visit, projectNumber: number)
                }
                
            } else if button2.isSelected {
                let type = Employee.EmployeeType.vendor
                guard let vendor = companyEntry.text else { return }
                
                if let vendorCompany = VendorCompanies(rawValue: vendor) {
                
                entrant = Employee(type: type, firstName: firstName, lastName: lastName, birthday: dob, streetAddress: address, city: city, state: state, zipCode: zipCode, vendorCompany: vendorCompany, visitDate: visit, projectNumber: nil)
                } else {
                    // add condition for possible nil to ensure failure
                    let vendorCompany: VendorCompanies? = nil
                     entrant = Employee(type: type, firstName: firstName, lastName: lastName, birthday: dob, streetAddress: address, city: city, state: state, zipCode: zipCode, vendorCompany: vendorCompany, visitDate: visit, projectNumber: nil)
                }
            }
        }
        
        // ensure entrant exists
        guard let newEntrant = entrant else { return }
        
        // when entrant exists, pass into pass generation function, catch errors
        do {
            pass = try Kiosk.generatePass(entrant: newEntrant)
            // if the pass was successfull generated, segue to next screen
            if pass != nil {
                performSegue(withIdentifier: "viewPass", sender: (Any).self)
            }
        } catch GuestRegistrationErrors.invalidFirstName {
            showAlert(title: "Missing information", message: GuestRegistrationErrors.invalidFirstName.localizedDescription)
        } catch GuestRegistrationErrors.invalidLastName {
            showAlert(title: "Missing information", message: GuestRegistrationErrors.invalidLastName.localizedDescription)
        } catch GuestRegistrationErrors.noFreeChildBirthday {
            showAlert(title: "Missing information", message: GuestRegistrationErrors.noFreeChildBirthday.localizedDescription)
        } catch GuestRegistrationErrors.childBirthdayNotConvertibleToDate {
            showAlert(title: "Missing information", message: GuestRegistrationErrors.childBirthdayNotConvertibleToDate.localizedDescription)
        } catch GuestRegistrationErrors.invalidFreeChildBirthday {
            showAlert(title: "Missing information", message: GuestRegistrationErrors.invalidFreeChildBirthday.localizedDescription)
        } catch GuestRegistrationErrors.noSeniorBirthday {
            showAlert(title: "Missing information", message: GuestRegistrationErrors.noSeniorBirthday.localizedDescription)
        } catch GuestRegistrationErrors.seniorBirthdayNotConvertibleToDate {
            showAlert(title: "Missing information", message: GuestRegistrationErrors.seniorBirthdayNotConvertibleToDate.localizedDescription)
        } catch GuestRegistrationErrors.invalidSeniorBirthday {
            showAlert(title: "Missing information", message: GuestRegistrationErrors.invalidSeniorBirthday.localizedDescription)
        } catch GuestRegistrationErrors.invalidSeasonPassAddress {
            showAlert(title: "Missing information", message: GuestRegistrationErrors.invalidSeasonPassAddress.localizedDescription)
        } catch GuestRegistrationErrors.invalidSeasonPassCity {
            showAlert(title: "Missing information", message: GuestRegistrationErrors.invalidSeasonPassCity.localizedDescription)
        } catch GuestRegistrationErrors.invalidSeasonPassState {
            showAlert(title: "Missing information", message: GuestRegistrationErrors.invalidSeasonPassState.localizedDescription)
        } catch GuestRegistrationErrors.invalidSeasonPassZipCode {
            showAlert(title: "Missing information", message: GuestRegistrationErrors.invalidSeasonPassZipCode.localizedDescription)
        } catch EmployeeRegistrationErrors.invalidFirstName {
            showAlert(title: "Missing information", message: EmployeeRegistrationErrors.invalidFirstName.localizedDescription)
        } catch EmployeeRegistrationErrors.invalidLastName {
            showAlert(title: "Missing information", message: EmployeeRegistrationErrors.invalidLastName.localizedDescription)
        } catch EmployeeRegistrationErrors.invalidAddress {
            showAlert(title: "Missing information", message: EmployeeRegistrationErrors.invalidAddress.localizedDescription)
        } catch EmployeeRegistrationErrors.invalidCity {
            showAlert(title: "Missing information", message: EmployeeRegistrationErrors.invalidCity.localizedDescription)
        } catch EmployeeRegistrationErrors.invalidState {
            showAlert(title: "Missing information", message: EmployeeRegistrationErrors.invalidState.localizedDescription)
        } catch EmployeeRegistrationErrors.invalidZipCode {
            showAlert(title: "Missing information", message: EmployeeRegistrationErrors.invalidZipCode.localizedDescription)
        } catch EmployeeRegistrationErrors.invalidContractProjectNumber {
            showAlert(title: "Missing information", message: EmployeeRegistrationErrors.invalidContractProjectNumber.localizedDescription)
        } catch EmployeeRegistrationErrors.contractNumberDoesntMatch {
             showAlert(title: "Missing information", message: EmployeeRegistrationErrors.contractNumberDoesntMatch.localizedDescription)
        } catch EmployeeRegistrationErrors.invalidVendorCompany {
            showAlert(title: "Missing information", message: EmployeeRegistrationErrors.invalidVendorCompany.localizedDescription)
        } catch EmployeeRegistrationErrors.vendorCompanyNotListed {
            showAlert(title: "Missing information", message: EmployeeRegistrationErrors.vendorCompanyNotListed.localizedDescription)
        } catch EmployeeRegistrationErrors.invalidVendorVisitDate {
            showAlert(title: "Missing information", message: EmployeeRegistrationErrors.invalidVendorVisitDate.localizedDescription)
        } catch EmployeeRegistrationErrors.invalidVendorBirthday {
            showAlert(title: "Missing information", message: EmployeeRegistrationErrors.invalidVendorBirthday.localizedDescription)
        } catch let error {
            print("\(error)")
        }
    }
    
    @IBAction func populateDateButtonPressed(_ sender: Any) {
        // populate fields with dummy data based on selections
        if guestButton.isSelected {
            if button1.isSelected { // classic
                let data = DummyData.defaultClassic
                firstNameEntry.text = data.firstName
                lastNameEntry.text = data.lastName
            } else if button2.isSelected { // free child
                let data = DummyData.defaultFreeChild
                firstNameEntry.text = data.firstName
                lastNameEntry.text = data.lastName
                
                if let dob = data.birthday {
                    dobEntry.text = dob
                }
            } else if button3.isSelected { // senior
                let data = DummyData.defaultSenior
                firstNameEntry.text = data.firstName
                lastNameEntry.text = data.lastName
                
                if let dob = data.birthday {
                    dobEntry.text = dob
                }
            }
        } else if specialButton.isSelected {
            if button1.isSelected { // vip
                let data = DummyData.defaultVip
                firstNameEntry.text = data.firstName
                lastNameEntry.text = data.lastName
            } else if button2.isSelected { // season pass
                let data = DummyData.defaultSeason
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
                let data = DummyData.defaultFoodService
                firstNameEntry.text = data.firstName
                lastNameEntry.text = data.lastName
                
                if let address = data.streetAddress, let city = data.city, let state = data.state, let zip = data.zipCode {
                    addressEntry.text = address
                    cityEntry.text = city
                    stateEntry.text = state
                    zipcodeEntry.text = String(describing: zip)
                }
            } else if button2.isSelected { // ride service
                let data = DummyData.defaultRideService
                firstNameEntry.text = data.firstName
                lastNameEntry.text = data.lastName
                
                if let address = data.streetAddress, let city = data.city, let state = data.state, let zip = data.zipCode {
                    addressEntry.text = address
                    cityEntry.text = city
                    stateEntry.text = state
                    zipcodeEntry.text = String(describing: zip)
                }
            } else if button3.isSelected { // maintenance
                let data = DummyData.defaultMaintenance
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
                let data = DummyData.defaultManager
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
                let data = DummyData.defaultContract
                firstNameEntry.text = data.firstName
                lastNameEntry.text = data.lastName
                
                if let address = data.streetAddress, let city = data.city, let state = data.state, let zip = data.zipCode, let projectNumber = data.projectNumber {
                    addressEntry.text = address
                    cityEntry.text = city
                    stateEntry.text = state
                    zipcodeEntry.text = String(describing: zip)
                    projectNumberEntry.text = String(describing: projectNumber.rawValue)
                }
            } else if button2.isSelected { // vendor
                let data = DummyData.defaultVendor
                firstNameEntry.text = data.firstName
                lastNameEntry.text = data.lastName
                
                if let company = data.vendorCompany, let dob = data.birthday, let visit = data.visitDate {
                    companyEntry.text = company.rawValue
                    dobEntry.text = dob
                    dateOfVisit.text = visit
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // perform segue and pass the pass haha
        if segue.destination is PassViewController {
            let destinationViewController = segue.destination as? PassViewController
            destinationViewController?.createdPass = pass
        }
    }
    
}

