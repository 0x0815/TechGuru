//
//  ViewController.swift
//  TechGuru
//
//  Created by Tobi on 11.10.16.
//  Copyright © 2016 DontPlayAlone.de. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    @IBOutlet weak var tableView: NSTableView!
    
    var status = ["status","dayin","sp_nummer","hans müller","macbook_pro","im arsch"]
    var dayin = ["01.10.2016","02.10.2016","02.10.2016","03.10.2016","04.10.2016","05.10.2016","06.10.2016"]
    var spnumber = ["SP34001258","SP34001258","SP34001258","SP34001258","SP34001258","SP34001258"]
    var customernames = ["Hans Müller","Hans Müller","Hans Müller","Hans Müller","Hans Müller","Hans Müller"]
    var artikle = ["MacBook Pro 15","MacBook Pro 15","MacBook Pro 15","MacBook Pro 15","MacBook Pro 15","MacBook Pro 15"]
    var errordescription = ["Im Arsch","Im Arsch","Im Arsch","Im Arsch","Im Arsch","Im Arsch"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
            
        }
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return status.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        <#code#>
    }

}


