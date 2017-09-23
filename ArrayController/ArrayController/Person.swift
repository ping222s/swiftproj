//
//  Person.swift
//  ArrayController
//
//  Created by Ios8dian on 2017/9/23.
//  Copyright © 2017年 ping222s. All rights reserved.
//

import Cocoa

class Person: NSObject {
    var name : String
    var age : Int
    
    override init() {
        self.name = "古开上"
        self.age = 20
    }
    
    init(name: String ,age: Int) {
        self.name = name
        self.age = age
    }
}
