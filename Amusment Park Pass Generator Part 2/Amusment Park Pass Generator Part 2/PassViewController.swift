//
//  PassViewController.swift
//  Amusment Park Pass Generator Part 1
//
//  Created by Kate Duncan-Welke on 11/17/18.
//  Copyright © 2018 Kate Duncan-Welke. All rights reserved.
//

import UIKit

class PassViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var passTypeLabel: UILabel!
    @IBOutlet weak var passDetailsLabel: UILabel!
   
    @IBOutlet weak var testResultsLabel: UILabel!
    
    var createdPass: Pass?
    
    // sounds
    let accessGranted = Sound(number: 0, resourceName: "AccessGranted", type: "wav")
    let accessDenied = Sound(number: 1, resourceName: "AccessDenied", type: "wav")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load sounds
        Sound.loadSound(number: &accessGranted.number, resourceName: accessGranted.resourceName, type: accessGranted.type)
        Sound.loadSound(number: &accessDenied.number, resourceName: accessDenied.resourceName, type: accessDenied.type)
    
        updateUI()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func updateUI() {
        switch createdPass {
        case is ClassicPass:
            guard let pass = createdPass as? ClassicPass else { return }
            let guest = pass.entrant
            updateLabels(guest: guest)
        case is VipPass:
            guard let pass = createdPass as? VipPass else { return }
            let guest = pass.entrant
            updateLabels(guest: guest)
        case is FreeChildPass:
            guard let pass = createdPass as? FreeChildPass else { return }
            let guest = pass.entrant
            updateLabels(guest: guest)
        case is SeniorPass:
            guard let pass = createdPass as? SeniorPass else { return }
            let guest = pass.entrant
            updateLabels(guest: guest)
        case is SeasonPass:
            guard let pass = createdPass as? SeasonPass else { return }
            let guest = pass.entrant
            updateLabels(guest: guest)
        case is RideServicesPass:
            guard let pass = createdPass as? RideServicesPass else { return }
            let guest = pass.entrant
            updateLabels(guest: guest)
        case is FoodServicePass:
            guard let pass = createdPass as? FoodServicePass else { return }
            let guest = pass.entrant
            updateLabels(guest: guest)
        case is MaintenancePass:
            guard let pass = createdPass as? MaintenancePass else { return }
            let guest = pass.entrant
            updateLabels(guest: guest)
        case is ManagerPass:
            guard let pass = createdPass as? ManagerPass else { return }
            let guest = pass.entrant
            updateLabels(guest: guest)
        case is ContractPass:
            guard let pass = createdPass as? ContractPass else { return }
            let guest = pass.entrant
            updateLabels(guest: guest)
        case is VendorPass:
            guard let pass = createdPass as? VendorPass else { return }
            let guest = pass.entrant
            updateLabels(guest: guest)
        default:
            break
        }
    }
    
    func updateLabels<T:Entrant>(guest: T) {
        nameLabel.text = "\(guest.firstName) \(guest.lastName)"
        
        guard let passName = createdPass?.passType else { return }
        passTypeLabel.text = "\(passName)"
    }
    
    func correctResult() {
        Sound.playSound(number: accessGranted.number)
        testResultsLabel.text = "Access granted"
    }
    
    func incorrectResult() {
        Sound.playSound(number: accessDenied.number)
        testResultsLabel.text = "Access denied"
    }
    
    @IBAction func testAccess(_ sender: UIButton) {
        guard let pass = createdPass else { return }
        switch sender.tag {
        case 0: // rides
            do {
                switch try Kiosk.swipe(pass: pass, forAccessTo: .rides) {
                case (true, true):
                    correctResult()
                    if let name = nameLabel.text {
                    showAlert(title: "Happy Birthday!", message: "Today is the day! Happy birthday \(name)!")
                    }
                case (true, false):
                    correctResult()
                case (false, true):
                    incorrectResult()
                    if let name = nameLabel.text {
                        showAlert(title: "Happy Birthday!", message: "Today is the day! Happy birthday \(name)!")
                    }
                case (false, false):
                    incorrectResult()
                }
            } catch PassSwipeErrors.passSwipedTooSoon {
                showAlert(title: "Unable to process pass", message: PassSwipeErrors.passSwipedTooSoon.localizedDescription)
            } catch let error {
                print("\(error)")
            }
        case 1: // amusements
            do {
                switch try Kiosk.swipe(pass: pass, forAccessTo: .amusements) {
                case (true, true):
                    correctResult()
                    if let name = nameLabel.text {
                        showAlert(title: "Happy Birthday!", message: "Today is the day! Happy birthday \(name)!")
                    }
                case (true, false):
                    correctResult()
                case (false, true):
                    incorrectResult()
                    if let name = nameLabel.text {
                        showAlert(title: "Happy Birthday!", message: "Today is the day! Happy birthday \(name)!")
                    }
                case (false, false):
                    incorrectResult()
                }
            } catch PassSwipeErrors.passSwipedTooSoon {
                showAlert(title: "Unable to process pass", message: PassSwipeErrors.passSwipedTooSoon.localizedDescription)
            } catch let error {
                print("\(error)")
            }
        case 2: // skip lines
            do {
                switch try Kiosk.swipe(pass: pass, forAccessTo: .skipLines) {
                case (true, true):
                    correctResult()
                    if let name = nameLabel.text {
                        showAlert(title: "Happy Birthday!", message: "Today is the day! Happy birthday \(name)!")
                    }
                case (true, false):
                    correctResult()
                case (false, true):
                    incorrectResult()
                    if let name = nameLabel.text {
                        showAlert(title: "Happy Birthday!", message: "Today is the day! Happy birthday \(name)!")
                    }
                case (false, false):
                    incorrectResult()
                }
            } catch PassSwipeErrors.passSwipedTooSoon {
                showAlert(title: "Unable to process pass", message: PassSwipeErrors.passSwipedTooSoon.localizedDescription)
            } catch let error {
                print("\(error)")
            }
        case 3: // kitchens
            do {
                switch try Kiosk.swipe(pass: pass, forAccessTo: .kitchen) {
                case (true, true):
                    correctResult()
                    if let name = nameLabel.text {
                        showAlert(title: "Happy Birthday!", message: "Today is the day! Happy birthday \(name)!")
                    }
                case (true, false):
                    correctResult()
                case (false, true):
                    incorrectResult()
                    if let name = nameLabel.text {
                        showAlert(title: "Happy Birthday!", message: "Today is the day! Happy birthday \(name)!")
                    }
                case (false, false):
                    incorrectResult()
                }
            } catch PassSwipeErrors.passSwipedTooSoon {
                showAlert(title: "Unable to process pass", message: PassSwipeErrors.passSwipedTooSoon.localizedDescription)
            } catch let error {
                print("\(error)")
            }
        case 4: // ride control
            do {
                switch try Kiosk.swipe(pass: pass, forAccessTo: .rideControl) {
                case (true, true):
                    correctResult()
                    if let name = nameLabel.text {
                        showAlert(title: "Happy Birthday!", message: "Today is the day! Happy birthday \(name)!")
                    }
                case (true, false):
                    correctResult()
                case (false, true):
                    incorrectResult()
                    if let name = nameLabel.text {
                        showAlert(title: "Happy Birthday!", message: "Today is the day! Happy birthday \(name)!")
                    }
                case (false, false):
                    incorrectResult()
                }
            } catch PassSwipeErrors.passSwipedTooSoon {
                showAlert(title: "Unable to process pass", message: PassSwipeErrors.passSwipedTooSoon.localizedDescription)
            } catch let error {
                print("\(error)")
            }
        case 5: // maintenance
            do {
                switch try Kiosk.swipe(pass: pass, forAccessTo: .maintenance) {
                case (true, true):
                    correctResult()
                    if let name = nameLabel.text {
                        showAlert(title: "Happy Birthday!", message: "Today is the day! Happy birthday \(name)!")
                    }
                case (true, false):
                    correctResult()
                case (false, true):
                    incorrectResult()
                    if let name = nameLabel.text {
                        showAlert(title: "Happy Birthday!", message: "Today is the day! Happy birthday \(name)!")
                    }
                case (false, false):
                    incorrectResult()
                }
            } catch PassSwipeErrors.passSwipedTooSoon {
                showAlert(title: "Unable to process pass", message: PassSwipeErrors.passSwipedTooSoon.localizedDescription)
            } catch let error {
                print("\(error)")
            }
        case 6: // office
            do {
                switch try Kiosk.swipe(pass: pass, forAccessTo: .office) {
                case (true, true):
                    correctResult()
                    if let name = nameLabel.text {
                        showAlert(title: "Happy Birthday!", message: "Today is the day! Happy birthday \(name)!")
                    }
                case (true, false):
                    correctResult()
                case (false, true):
                    incorrectResult()
                    if let name = nameLabel.text {
                        showAlert(title: "Happy Birthday!", message: "Today is the day! Happy birthday \(name)!")
                    }
                case (false, false):
                    incorrectResult()
                }
            } catch PassSwipeErrors.passSwipedTooSoon {
                showAlert(title: "Unable to process pass", message: PassSwipeErrors.passSwipedTooSoon.localizedDescription)
            } catch let error {
                print("\(error)")
            }
        case 7: // food discount
            do {
                switch try Kiosk.swipe(pass: pass, forAccessTo: .foodDiscount) {
                case (true, true):
                    Sound.playSound(number: accessGranted.number)
                    testResultsLabel.text = "Access granted, \(pass.foodDiscount)% discount"
                    if let name = nameLabel.text {
                        showAlert(title: "Happy Birthday!", message: "Today is the day! Happy birthday \(name)!")
                    }
                case (true, false):
                    Sound.playSound(number: accessGranted.number)
                    testResultsLabel.text = "Access granted, \(pass.foodDiscount)% discount"
                case (false, true):
                    Sound.playSound(number: accessDenied.number)
                    testResultsLabel.text = "No discount available"
                    if let name = nameLabel.text {
                        showAlert(title: "Happy Birthday!", message: "Today is the day! Happy birthday \(name)!")
                    }
                case (false, false):
                    Sound.playSound(number: accessDenied.number)
                    testResultsLabel.text = "No discount available"
                }
            } catch PassSwipeErrors.passSwipedTooSoon {
                showAlert(title: "Unable to process pass", message: PassSwipeErrors.passSwipedTooSoon.localizedDescription)
            } catch let error {
                print("\(error)")
            }
        case 8: // merch discount
            do {
                switch try Kiosk.swipe(pass: pass, forAccessTo: .merchDiscount) {
                case (true, true):
                    Sound.playSound(number: accessGranted.number)
                    testResultsLabel.text = "Access granted, \(pass.merchandiseDiscount)% discount"
                    if let name = nameLabel.text {
                        showAlert(title: "Happy Birthday!", message: "Today is the day! Happy birthday \(name)!")
                    }
                case (true, false):
                    Sound.playSound(number: accessGranted.number)
                    testResultsLabel.text = "Access granted, \(pass.merchandiseDiscount)% discount"
                case (false, true):
                    Sound.playSound(number: accessDenied.number)
                    testResultsLabel.text = "No discount available"
                    if let name = nameLabel.text {
                        showAlert(title: "Happy Birthday!", message: "Today is the day! Happy birthday \(name)!")
                    }
                case (false, false):
                    Sound.playSound(number: accessDenied.number)
                    testResultsLabel.text = "No discount available"
                }
            } catch PassSwipeErrors.passSwipedTooSoon {
                showAlert(title: "Unable to process pass", message: PassSwipeErrors.passSwipedTooSoon.localizedDescription)
            } catch let error {
                print("\(error)")
            }
        default:
            break
        }
    }
    
    
    @IBAction func createNewPassButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "backToCreation", sender: (Any).self)
    }
    
}
