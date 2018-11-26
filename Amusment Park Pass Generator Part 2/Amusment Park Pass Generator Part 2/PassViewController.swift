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
    @IBOutlet weak var passQualitiesLabel: UILabel!
    
    @IBOutlet weak var testResultsLabel: UILabel!
    
    var createdPass: Pass?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()

        print("\(createdPass)")
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
    
    
    @IBAction func testAccess(_ sender: UIButton) {
        guard let pass = createdPass else { return }
        switch sender.tag {
        case 0: // rides
            if pass.rideAccess {
                testResultsLabel.text = "Access granted"
            } else {
                testResultsLabel.text = "Access denied"
            }
        case 1: // amusements
            if pass.amusementAccess {
                testResultsLabel.text = "Access granted"
            } else {
                testResultsLabel.text = "Access denied"
            }
        case 2: // skip lines
            if pass.skipRideLines {
                testResultsLabel.text = "Access granted"
            } else {
                testResultsLabel.text = "Access denied"
            }
        case 3: // kitchens
            if pass.kitchenAccess {
                testResultsLabel.text = "Access granted"
            } else {
                testResultsLabel.text = "Access denied"
            }
        case 4: // ride control
            if pass.rideControlAccess {
                testResultsLabel.text = "Access granted"
            } else {
                testResultsLabel.text = "Access denied"
            }
        case 5: // maintenance
            if pass.maintenanceAccess {
                testResultsLabel.text = "Access granted"
            } else {
                testResultsLabel.text = "Access denied"
            }
        case 6: // office
            if pass.officeAccess {
                testResultsLabel.text = "Access granted"
            } else {
                testResultsLabel.text = "Access denied"
            }
        case 7: // food discount
            if pass.foodDiscount != 0 {
                testResultsLabel.text = "Access granted, \(pass.foodDiscount)% discount"
            } else {
                testResultsLabel.text = "No discount available"
            }
        case 8: // merch discount
            if pass.merchandiseDiscount != 0 {
                testResultsLabel.text = "Access granted, \(pass.merchandiseDiscount)% discount"
            } else {
                testResultsLabel.text = "No discount available"
            }
        default:
            break
        }
    }
    

}
