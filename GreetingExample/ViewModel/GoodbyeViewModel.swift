//
//  GoodbyeViewModel.swift
//  GreetingExample
//
//  Created by Zeno on 16/07/2019.
//  Copyright © 2019 Zeno. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay
import RxCocoa

class GoodbyeViewModel {
    var firstName = BehaviorRelay<String>(value: "")
    var lastName = BehaviorRelay<String>(value: "")
    
//    var dataProvider: DataProvider?
    
    var message: Observable<String> {
        return Observable.combineLatest(firstName.asObservable(), lastName.asObservable()) { first, last in
            String("Good bye \(last),  \(first)!!!")
        }
    }
    
//    init(){
//        self.dataProvider = DataProvider()
//    }
    
//    init(dataProvider: DataProvider) {
//////        firstName.accept(dataProvider.firstName)
//////        lastName.accept(dataProvider.lastName)
//        self.dataProvider = dataProvider
//    }
    // TODO:
//    var person: Person?
}
