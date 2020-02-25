//
//  TopLevelStorage.swift
//  2018-08-20-read-JSON
//
//  Created by Phillip Bradford on 8/20/18.
//  Copyright © 2018 Phillip Bradford. All rights reserved.
//

import Foundation

class TopLevelStorage {
        
    let completeFILEUrl = URL(string: "file:///Users/pgb15001/data/2020/presidents.json")
    let url = "https://restcountries.eu/rest/v2/all"
    
    init() {
        
        URLSession.shared.dataTask(with: completeFILEUrl!) { (data, response, error) in
            do {
                let presidents = try JSONDecoder().decode([President].self, from: data!)
                
                for c in presidents {
                    print(c.name)
                }
                
            } catch {
                print(error)
            }
        
        }.resume()
        
        print("After closure!")
        
        
        /*
         * REST call
         *
         */
        let restObj = URL(string: url)
         
        URLSession.shared.dataTask(with: restObj!) { (data, response, error) in
                do {
                    let countries = try JSONDecoder().decode([Country].self, from: data!)
                    
                    //print(response)
                    if let httpResponse = response as? HTTPURLResponse {
                        print(httpResponse.statusCode)
                    }
                    for c in countries {
                        if (c.name.starts(with: "U")) {
                            print(c.name)
                        }
                    }
                    
                } catch {
                    print(error)
                }
            
        }.resume()

        print("After REST call")
    }
}
