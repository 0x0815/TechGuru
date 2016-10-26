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
    @IBOutlet weak var userNameLabel: NSTextField!
    @IBOutlet weak var newCasesLabel: NSTextField!
    @IBOutlet weak var inProgressCasesLabel: NSTextField!
    @IBOutlet weak var inDiagCasesLabel: NSTextField!
    @IBOutlet weak var waitingCasesLabel: NSTextField!
    @IBOutlet weak var carryInCasesLabel: NSTextField!
    @IBOutlet weak var mailInCasesLabel: NSTextField!
    @IBOutlet weak var doneCasesLabel: NSTextField!

    
    
    let data:[NSMutableDictionary] = [["status": "1", "dayin": "01.10.2016", "spnumber": "SP34009854", "customername": "Hans Harry Müller", "article": "MacBook Pro 15", "errordescription": "Kunde wünscht komplettaustausch über Hersteller. Mit SP34001288 wurden bereits 20 ? bezahlt."],
                               ["status": "10", "dayin": "01.10.2016", "spnumber": "SP34009854", "customername": "Hans Harry Müller", "article": "MacBook Pro 15", "errordescription": "Kunde wünscht Austausch über den Hersteller."],
                               ["status": "60", "dayin": "01.10.2016", "spnumber": "SP34009854", "customername": "Hans Harry Müller", "article": "MacBook Pro 15", "errordescription": "Sturzschaden am linken oberen Bildschirmrand. Apple Care-Gerät."],
                               ["status": "60", "dayin": "01.10.2016", "spnumber": "SP34009854", "customername": "Hans Harry Müller", "article": "MacBook Pro 15", "errordescription": "Displaybruch und Lautstärkeregeler funktioniert nicht. Apple auf Gewährleistung anfragen."],
                               ["status": "70", "dayin": "01.10.2016", "spnumber": "SP34009854", "customername": "Hans Harry Müller", "article": "MacBook Pro 15", "errordescription": "Ist in die Toilette gefallen. Info lieber per Mail"],
                               ["status": "90", "dayin": "01.10.2016", "spnumber": "SP34009854", "customername": "Hans Harry Müller", "article": "MacBook Pro 15", "errordescription": "Gerät zur Diagnose. Daraufhin Displaytausch nach Absprache mit dem Kunden."]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countStatusInCases()
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
            
        }
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return data[row].value(forKey: (tableColumn?.identifier)!)
    }
    
    func countStatusInCases(){
        var new: Int = 0
        var inprogress: Int = 0
        var indiag: Int = 0
        var waiting: Int = 0
        var carryin: Int = 0
        var mailin: Int = 0
        var done: Int = 0
        
        for item in data {
            switch item.value(forKey: "status"){
            case "1" as String:
                new += 1
            case "10" as String:
                inprogress += 1
            case "50" as String:
                indiag += 1
            case "60" as String:
                waiting += 1
            case "70" as String:
                carryin += 1
            case "80" as String:
                mailin += 1
            case "90" as String:
                done += 1
            default:
                print("")
            }
        }
        
        newCasesLabel.integerValue = new
        inProgressCasesLabel.integerValue = inprogress
        inDiagCasesLabel.integerValue = indiag
        waitingCasesLabel.integerValue = waiting
        carryInCasesLabel.integerValue = carryin
        mailInCasesLabel.integerValue = mailin
        doneCasesLabel.integerValue = done
        
    }
}


