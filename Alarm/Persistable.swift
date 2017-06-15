//
//  Persistable.swift
//  WakeUp
//
//  Created by Anastasia Chetrusca on 4/25/17.
//  Copyright © 2017. All rights reserved.
//

import Foundation

protocol Persistable{
    var ud: UserDefaults {get}
    var persistKey : String {get}
    func persist()
    func unpersist()
}
