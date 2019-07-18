//
//  GreetingViewModel.swift
//  GreetingExample
//
//  Created by Zeno on 16/07/2019.
//  Copyright © 2019 Zeno. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay
import RxCocoa

class GreetingViewModel {
    var firstName = BehaviorRelay<String>(value: "")
    var lastName = BehaviorRelay<String>(value: "")
    
    var message: Observable<String> {
        return Observable.combineLatest(firstName.asObservable(), lastName.asObservable()) { first, last in
            String("Hello \(last),  \(first)!!!")
        }
    }
    
    // TODO: use person model class
//    let person: Person? = nil
}
