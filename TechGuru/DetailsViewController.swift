//
//  DetailsViewController.swift
//  TechGuru
//
//  Created by Tobi on 01.11.16.
//  Copyright © 2016 DontPlayAlone.de. All rights reserved.
//

import Cocoa

class DetailsViewController: NSViewController {
    
    @IBOutlet weak var spNumberLabel: NSTextField!
    @IBOutlet weak var deviceNSLabel: NSTextField!
    @IBOutlet weak var customerNameLabel: NSTextField!
    @IBOutlet weak var customerMailLabel: NSTextField!
    @IBOutlet weak var customerPhoneLabel: NSTextField!
    @IBOutlet weak var errordescriptionField: NSTextField!
    
    var spNumber: String = ""
    var deviceSN: String = ""
    var customerName: String = ""
    var customerMail: String = ""
    var customerPhone: String = ""
    var errordescription: String = ""
    
    override func viewDidLoad() {
        spNumberLabel.stringValue = spNumber
        deviceNSLabel.stringValue = deviceSN
        customerNameLabel.stringValue = customerName
        customerMailLabel.stringValue = customerMail
        customerPhoneLabel.stringValue = customerPhone
        errordescriptionField.stringValue = errordescription
    } 
}
