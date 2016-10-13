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
    
    let data:[NSMutableDictionary] = [["status": "1", "dayin": "01.10.2016", "sp_nummer": "SP34009854", "customername": "Hans Harry Müller", "article": "MacBook Pro 15", "errordesciption": "Total im Arsch"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
            
        }
    }
    
    func numberOfRowsInTableView(aTableView: NSTableView!) -> Int{
        return data.count
    }

}


