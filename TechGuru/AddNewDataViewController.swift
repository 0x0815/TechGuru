//
//  AddNewDataViewController.swift
//  TechGuru
//
//  Created by Tobi on 01.11.16.
//  Copyright © 2016 DontPlayAlone.de. All rights reserved.
//

import Cocoa

class AddNewDataViewController: NSViewController {
    @IBOutlet weak var addNewDataTextfield: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addNewDataButton(_ sender: Any) {
        print(addNewDataTextfield.stringValue)
        self.dismiss(sender)
    }
}
