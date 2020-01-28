//
//  Character.swift
//  savingApp
//
//  Created by Kaelen Cook on 1/23/20.
//  Copyright © 2020 Kaelen Cook. All rights reserved.
//

import Foundation

class Character: Codable {
    init(name:String, hp:Int, klass:String) {
        self.health = hp
        self.name = name
        self.klass = klass
    }
    var health:Int = 0
    var name:String = ""
    var klass:String = ""
}
