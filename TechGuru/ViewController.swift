//
//  ViewController.swift
//  TechGuru
//
//  Created by Tobi on 11.10.16.
//  Copyright © 2016 DontPlayAlone.de. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate, NSWindowDelegate, NSSharingServiceDelegate {

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
    
    var data: [DataModel] = [DataModel(status: "80", spnumber: "SP34004581", customername: "Hans Meier", mail: "test@test.de", phone: "015425468547", article: "MacBook Pro 15", dayin: "05.10.2016", errordescription: "Ist in die Toilette gefallen. Info lieber per Mail"),
                             DataModel(status: "75", spnumber: "SP34004582", customername: "Hans Meier", mail: "test@test.de", phone: "015425468547",  article: "MacBook Pro 15", dayin: "05.10.2016", errordescription: "Ist in die Toilette gefallen. Info lieber per Mail"),
                             DataModel(status: "70", spnumber: "SP34004583", customername: "Hans Meier", mail: "test@test.de", phone: "015425468547",  article: "MacBook Pro 15", dayin: "05.10.2016", errordescription: "Ist in die Toilette gefallen. Info lieber per Mail"),
                             DataModel(status: "60", spnumber: "SP34004584", customername: "Hans Meier", mail: "test@test.de", phone: "015425468547",  article: "MacBook Pro 15", dayin: "05.10.2016", errordescription: "Ist in die Toilette gefallen. Info lieber per Mail"),
                             DataModel(status: "20", spnumber: "SP34004585", customername: "Hans Meier", mail: "test@test.de", phone: "015425468547",  article: "MacBook Pro 15", dayin: "05.10.2016", errordescription: "Ist in die Toilette gefallen. Info lieber per Mail"),
                             DataModel(status: "10", spnumber: "SP34004586", customername: "Hans Meier", mail: "test@test.de", phone: "015425468547",  article: "MacBook Pro 15", dayin: "05.10.2016", errordescription: "Ist in die Toilette gefallen. Info lieber per Mail"),
                             DataModel(status: "1", spnumber: "SP34004587", customername: "Hans Meier", mail: "test@test.de", phone: "015425468547",  article: "MacBook Pro 15", dayin: "05.10.2016", errordescription: "Ist in die Toilette gefallen. Info lieber per Mail"),
                             DataModel(status: "1", spnumber: "SP34004588", customername: "Hans Meier", mail: "test@test.de", phone: "015425468547",  article: "MacBook Pro 15", dayin: "05.10.2016", errordescription: "Ist in die Toilette gefallen. Info lieber per Mail")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let clickedRow = tableView.clickedRow
        
        if (clickedRow != -1) {
        }
    }
    
    @IBAction func changeStateToInProgress(_ sender: Any) {
        let clickedRow = tableView.clickedRow
        
        if (clickedRow != -1) {
        }
    }
    
    @IBAction func changeStateToInDiag(_ sender: Any) {
        let clickedRow = tableView.clickedRow
        
        if (clickedRow != -1) {
        }
    }
    
    @IBAction func changeStateToWaitingQuotation(_ sender: Any) {
        let clickedRow = tableView.clickedRow
        
        if (clickedRow != -1) {
            var sex = ""
            
            if sexDiaglog() {
                sex = "Herr"
            } else {
                sex = "Frau"
            }
            
            let spNumber = data[clickedRow].spnumber
            let recipients = data[clickedRow].mail
            let customername = data[clickedRow].customername!.components(separatedBy: " ")
            let body = "Sehr geehrter " + sex + " " + customername[1] + ",\n\nhier ist ihr KVA. Blablabla"
        
            let service = NSSharingService(named: NSSharingServiceNameComposeEmail)
            service?.delegate = self
            service?.recipients = [recipients!]
            service?.subject = "Kostenvoranschlag - Referenz: " + spNumber!
            service?.perform(withItems: [body])
        }
    }
    
    @IBAction func changeStateToFMI(_ sender: Any) {
        let clickedRow = tableView.clickedRow
        
        if (clickedRow != -1) {
            var sex = ""
            
            if sexDiaglog() {
                sex = "Herr"
            } else {
                sex = "Frau"
            }
            
            let spNumber = data[clickedRow].spnumber
            let recipients = data[clickedRow].mail
            let customername = data[clickedRow].customername!.components(separatedBy: " ")
            let body = "Sehr geehrter " + sex + " " + customername[1] + ",\n\nFMI noch aktiv, blabla"
            
            let service = NSSharingService(named: NSSharingServiceNameComposeEmail)
            service?.delegate = self
            service?.recipients = [recipients!]
            service?.subject = "Find My iPhone ist noch aktiv - Referenz: " + spNumber!
            service?.perform(withItems: [body])
        }
    }
    
    @IBAction func changeStateToPIN(_ sender: Any) {
        let clickedRow = tableView.clickedRow
        
        if (clickedRow != -1) {
            var sex = ""
            
            if sexDiaglog() {
                sex = "Herr"
            } else {
                sex = "Frau"
            }
            
            let spNumber = data[clickedRow].spnumber
            let recipients = data[clickedRow].mail
            let customername = data[clickedRow].customername!.components(separatedBy: " ")
            let body = "Sehr geehrter " + sex + " " + customername[1] + ",\n\num weiter machen zu können benötigen wir den Pin blablabla"
            
            let service = NSSharingService(named: NSSharingServiceNameComposeEmail)
            service?.delegate = self
            service?.recipients = [recipients!]
            service?.subject = "Der Pin ihres iPhones wird benötigt - Referenz: " + spNumber!
            service?.perform(withItems: [body])
        }
    }
    
    @IBAction func changeStateToCarryIn(_ sender: Any) {
        let clickedRow = tableView.clickedRow
        
        if clickedRow != -1 {
        }
    }
    
    @IBAction func changeStateToMailIn(_ sender: Any) {
        let clickedRow = tableView.clickedRow
        
        if clickedRow != -1 {
        }
    }
    
    @IBAction func changeStateToDone(_ sender: Any) {
        let clickedRow = tableView.clickedRow
        
        if clickedRow != -1 {
        }
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        let clickedRow = tableView.clickedRow
        
        if segue.identifier == "detailsSegue" {
            if let destinationDetailViewController = segue.destinationController as? DetailsViewController {
                if clickedRow != -1 {
                    destinationDetailViewController.spNumber = data[clickedRow].spnumber!
                    destinationDetailViewController.deviceSN = data[clickedRow].article!
                    destinationDetailViewController.customerName = data[clickedRow].customername!
                    destinationDetailViewController.customerMail = data[clickedRow].mail!
                    destinationDetailViewController.customerPhone = data[clickedRow].phone!
                    destinationDetailViewController.errordescription = data[clickedRow].errordescription!
                }
            }
        }
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
    
    func sexDiaglog() -> Bool {
        let popup: NSAlert = NSAlert()
        popup.messageText = "Ist der Kunde Weiblich oder Männlich?"
        popup.informativeText = "Da BT6 leider keine Daten über das, bei der Kundenannahme ausgewählte, Geschlecht liefert wähle es bitte hier aus."
        popup.alertStyle = NSAlertStyle.informational
        popup.addButton(withTitle: "Männlich")
        popup.addButton(withTitle: "Weiblich")
        return popup.runModal() == NSAlertFirstButtonReturn
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


