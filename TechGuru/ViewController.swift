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
    @IBOutlet weak var newCasesLabel: NSTextField!
    @IBOutlet weak var inProgressCasesLabel: NSTextField!
    @IBOutlet weak var inDiagCasesLabel: NSTextField!
    @IBOutlet weak var waitingCasesLabel: NSTextField!
    @IBOutlet weak var carryInCasesLabel: NSTextField!
    @IBOutlet weak var mailInCasesLabel: NSTextField!
    @IBOutlet weak var doneCasesLabel: NSTextField!
    @IBOutlet var changeStateMenu: NSMenu!
    
    let statusBarItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)

    var data: [DataModel] = [DataModel(status: "80", spnumber: "SP34004584", customername: "Hans Meier", article: "MacBook Pro 15", dayin: "05.10.2016", errordescription: "Ist in die Toilette gefallen. Info lieber per Mail"),
                             DataModel(status: "75", spnumber: "SP34004584", customername: "Hans Meier", article: "MacBook Pro 15", dayin: "05.10.2016", errordescription: "Ist in die Toilette gefallen. Info lieber per Mail"),
                             DataModel(status: "70", spnumber: "SP34004584", customername: "Hans Meier", article: "MacBook Pro 15", dayin: "05.10.2016", errordescription: "Ist in die Toilette gefallen. Info lieber per Mail"),
                             DataModel(status: "60", spnumber: "SP34004584", customername: "Hans Meier", article: "MacBook Pro 15", dayin: "05.10.2016", errordescription: "Ist in die Toilette gefallen. Info lieber per Mail"),
                             DataModel(status: "20", spnumber: "SP34004584", customername: "Hans Meier", article: "MacBook Pro 15", dayin: "05.10.2016", errordescription: "Ist in die Toilette gefallen. Info lieber per Mail"),
                             DataModel(status: "10", spnumber: "SP34004584", customername: "Hans Meier", article: "MacBook Pro 15", dayin: "05.10.2016", errordescription: "Ist in die Toilette gefallen. Info lieber per Mail"),
                             DataModel(status: "1", spnumber: "SP34004584", customername: "Hans Meier", article: "MacBook Pro 15", dayin: "05.10.2016", errordescription: "Ist in die Toilette gefallen. Info lieber per Mail"),
                             DataModel(status: "1", spnumber: "SP34004584", customername: "Hans Meier", article: "MacBook Pro 15", dayin: "05.10.2016", errordescription: "Ist in die Toilette gefallen. Info lieber per Mail")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        statusBarItem.title = "TechGuru"
        tableView.focusRingType = NSFocusRingType.none
        countCases()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return data.count
    }
    
    
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let identifier = tableColumn?.identifier as NSString?
        
        if (identifier == "status") {
            let cell = tableView.make(withIdentifier: "status", owner: self) as! NSTableCellView
            
            if (self.data[row].status! == "1")  {
                cell.textField?.stringValue = "Neu"
            } else if (self.data[row].status! == "10")  {
                cell.textField?.stringValue = "In Bearbeitung"
            } else if (self.data[row].status! == "20")  {
                cell.textField?.stringValue = "In Diagnose"
            } else if (self.data[row].status! == "60")  {
                cell.textField?.stringValue = "Wartend"
            } else if (self.data[row].status! == "70")  {
                cell.textField?.stringValue = "Mail In"
            } else if (self.data[row].status! == "75")  {
                cell.textField?.stringValue = "Carry In"
            } else if (self.data[row].status! == "80")  {
                cell.textField?.stringValue = "Ausgabe"
            }
            return cell
        }else if (identifier == "spnumber"){
            let cell = tableView.make(withIdentifier: "spnumber", owner: self) as! NSTableCellView
            cell.textField?.stringValue = self.data[row].spnumber!
            return cell
        }else if (identifier == "customername"){
            let cell = tableView.make(withIdentifier: "customername", owner: self) as! NSTableCellView
            cell.textField?.stringValue = self.data[row].customername!
            return cell
        }else if (identifier == "article"){
            let cell = tableView.make(withIdentifier: "article", owner: self) as! NSTableCellView
            cell.textField?.stringValue = self.data[row].article!
            return cell
        }else if (identifier == "errordescription"){
            let cell = tableView.make(withIdentifier: "errordescription", owner: self) as! NSTableCellView
            cell.textField?.stringValue = self.data[row].errordescription!
            return cell
        }else if (identifier == "dayin"){
            let cell = tableView.make(withIdentifier: "dayin", owner: self) as! NSTableCellView
            cell.textField?.stringValue = self.data[row].dayin!
            return cell
        }
        return nil
    }

    func tableView(_ tableView: NSTableView, didAdd rowView: NSTableRowView, forRow row: Int) {
        if (data[row].status == "1") {
            //grün
            //rowView.backgroundColor = NSColor(netHex: 0xC4FFCB)
        } else if (data[row].status == "10") {
            //lila
            rowView.backgroundColor = NSColor(netHex: 0xD3BDFF)
        } else if (data[row].status == "20") {
            //blau
            rowView.backgroundColor = NSColor(netHex: 0xBDD4FF)
        } else if (data[row].status == "60") {
            //orange
            rowView.backgroundColor = NSColor(netHex: 0xFFCFB5)
        } else if (data[row].status == "70") {
            //pink
            rowView.backgroundColor = NSColor(netHex: 0xFFB9F0)
        } else if (data[row].status == "75") {
            //pink
            rowView.backgroundColor = NSColor(netHex: 0xFFB9F0)
        } else if (data[row].status == "80") {
            //grün
            rowView.backgroundColor = NSColor(netHex: 0xC4FFCB)
        }
    }

    @IBAction func chnageStatusToNew(_ sender: Any) {
        print(sender)
    }
    
    func countCases(){
        var new: Int = 0
        var inprogress: Int = 0
        var diag: Int = 0
        var waiting: Int = 0
        var carryin: Int = 0
        var mailin: Int = 0
        var done: Int = 0
        
        for item in data {
            if (item.status == "1") {
                new += 1
            } else if (item.status == "10") {
                inprogress += 1
            } else if (item.status == "20") {
                diag += 1
            } else if (item.status == "60") {
                waiting += 1
            }else if (item.status == "70") {
                carryin += 1
            } else if (item.status == "75") {
                mailin += 1
            }else if (item.status == "80") {
                done += 1
            }
        }
        
        newCasesLabel.integerValue = new
        inProgressCasesLabel.integerValue = inprogress
        inDiagCasesLabel.integerValue = diag
        waitingCasesLabel.integerValue = waiting
        carryInCasesLabel.integerValue = carryin
        mailInCasesLabel.integerValue = mailin
        doneCasesLabel.integerValue = done
    }
}

extension NSColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}


