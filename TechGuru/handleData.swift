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
        
        let cleanedData = postData.replacingOccurrences(of: "\"", with: "")
        let csv = CSwiftV(with: cleanedData, separator: ";")
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: csv.rows)
            let jsonString: String = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue) as! String
            print(jsonString)
            let postString = "data=" + jsonString
            
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
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
