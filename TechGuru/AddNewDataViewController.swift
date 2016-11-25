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
        let sendData = handleData()
        sendData.addNewDataHTML(postData: addNewDataTextfield.stringValue)
        self.dismiss(sender)
    }
    
    override func viewDidDisappear() {
        let viewController = ViewController()
        viewController.updateView()
        //update table
    }
}
