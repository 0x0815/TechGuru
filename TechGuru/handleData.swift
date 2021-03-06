//
//  handleData.swift
//  TechGuru
//
//  Created by Tobi on 01.11.16.
//  Copyright © 2016 DontPlayAlone.de. All rights reserved.
//

import Foundation

class handleData {
    func addNewDataHTML(postData: String) {
        var postString = "csv=" + postData.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
        postString = postString.replacingOccurrences(of: "¶", with: "")
        var request = URLRequest(url: URL(string: "http://aca.dontplayalone.de/connect.php")!)
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: .utf8)
            
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in guard let data = data, error == nil else {
                print("error=\(String(describing: error))")
                return
            }
                
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
                
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(String(describing: responseString))")
        }
        task.resume()
    }
    
    func getAllCasesAsTGDataModel(status: Int = -1) -> [DataModel] {
        var data: [DataModel] = []

        let url = URL(string:"http://aca.dontplayalone.de/json.php?status=\(status)")
        do {
            let apiData = try Data(contentsOf: url!)
            let allCases = try JSONSerialization.jsonObject(with: apiData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
            if let arrJSON = allCases["data"] {
                if arrJSON.count != 0 {
                    for index in 0...arrJSON.count-1 {
                        let aObject = arrJSON[index] as! [String : AnyObject]
                        data.append(DataModel(status: aObject["status"] as! String,
                                              spnumber: aObject["spnr"] as! String,
                                              customername: aObject["kdName"] as! String,
                                              mail: aObject["mail"] as! String,
                                              phone: aObject["mobil"] as! String,
                                              article: aObject["artdescr"] as! String,
                                              dayin: aObject["dayin"] as! String,
                                              errordescription: aObject["errdescr"] as! String))
                    }
                }
            }
        } catch let error as NSError{
            print(error.localizedDescription)
        }
        //print("Got Data - Status: \(status)")
        return data
        
    }
    
    func updateRow(spNumber: String, status: String) {
        let url = URL(string:"http://aca.dontplayalone.de/update.php?spnr=\(spNumber)&status=\(status)")
        do {
            let apiData = try Data(contentsOf: url!)
            print(apiData)
        }catch let error as NSError{
            print(error.localizedDescription)
        }
    }
}

