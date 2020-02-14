//
//  President.swift
//  2018-08-20-read-JSON
//
//  Created by Phillip Bradford on 8/20/18.
//  Copyright © 2018 Phillip Bradford. All rights reserved.
//

struct President: Codable {
    let name: String
    let which: String
    let description: String
    
    func getString() {
        print( "Name: \(name), When: \(which),  Descrption: \(description)" )
    }
}
