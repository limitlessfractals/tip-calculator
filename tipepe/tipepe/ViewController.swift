//
//  ViewController.swift
//  tipepe
//
//  Created by Wuqiong Fan on 1/5/17.
//  Copyright © 2017 Wuqiong Fan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // ctrl + drag elements to here to initialize them
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // dismisses keyboard on tap
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    // function that calculates the tip
    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages = [0.15, 0.18, 0.2, 0.25]
        
        //load defaults from settings
        let defaults = UserDefaults.standard
        let dBill = defaults.double(forKey: "myDouble")
        
        // convert string to double and set default to 0
        let bill = Double(billField.text!) ?? dBill
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // set text field values as strings of the number to 2 decimal places
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    // allows instant update with Tip Control changes
    @IBAction func vaChange(_ sender: Any) {
        self.calculateTip(Any.self)
    }

    
    
}


