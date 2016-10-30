//
//  DataModel.swift
//  TechGuru
//
//  Created by Tobi on 30.10.16.
//  Copyright © 2016 DontPlayAlone.de. All rights reserved.
//

class DataModel {
    var status: String?
    var spnumber: String?
    var customername: String?
    var article: String?
    var dayin: String?
    var errordescription: String?
    
    init(status: String, spnumber: String, customername: String, article: String, dayin: String, errordescription: String) {
        self.status = status
        self.spnumber = spnumber
        self.customername = customername
        self.article = article
        self.dayin = dayin
        self.errordescription = errordescription
    }
}
