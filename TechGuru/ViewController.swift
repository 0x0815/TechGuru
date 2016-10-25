//
//  ViewController.swift
//  TechGuru
//
//  Created by Tobi on 11.10.16.
//  Copyright © 2016 DontPlayAlone.de. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate, NSWindowDelegate {

    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var addNewDataTextField: NSTextField!
    @IBOutlet weak var addNewDataButton: NSButton!

    let data:[NSDictionary] = [["status": "1", "dayin": "01.10.2016", "spnumber": "SP34009854", "customername": "Hans Harry Müller", "article": "MacBook Pro 15", "errordescription": "Total im Arsch"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
            
        }
    }

    @IBAction func addNewDataButtonAction(_ sender: AnyObject) {
        //print(addNewDataTextField.objectValue)
        let data: String = addNewDataTextField.objectValue as! String
        let newData = data.replacingOccurrences(of: "\"", with: "")
        let csv = CSwiftV(with: newData, separator: ";")
        dump(csv.keyedRows)

    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        print(data[row].value(forKey: (tableColumn?.identifier)!))
        return data[row].value(forKey: (tableColumn?.identifier)!)
    }
    
    func windowWillClose(_ notification: Notification) {
        print(notification)
    }
}


