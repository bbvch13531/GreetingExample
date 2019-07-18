//
//  DataProvider.swift
//  GreetingExample
//
//  Created by Zeno on 18/07/2019.
//  Copyright © 2019 Zeno. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class DataProvider {
    
    var firstName = ""
    var lastName = ""
    
    init() { }
    
    init(_ firstName: String, _ lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}
