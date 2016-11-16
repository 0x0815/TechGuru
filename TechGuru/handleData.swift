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
        let postString = "data=" + postData.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "&", with: " u. ")
        
        var request = URLRequest(url: URL(string: "http://aca.dontplayalone.de/newdata.php")!)
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: .utf8)
            
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in guard let data = data, error == nil else {
                print("error=\(error)")
                return
            }
                
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
                
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
        }
        task.resume()
    }
    
    func addNewData(){
        var request = URLRequest(url: URL(string: "http://aca.dontplayalone.de/json.php")!)
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in guard let data = data, error == nil else {
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
        }
        task.resume()
    }
}

