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
    var firstName: BehaviorRelay<String>
    var lastName: BehaviorRelay<String>
    
//    var dataProvider: DataProvider?
    
    var message: Observable<String> {
        return Observable.combineLatest(firstName.asObservable(), lastName.asObservable()) { first, last in
            String("Good bye \(last),  \(first)!!!")
        }
    }
    
    init(_ firstName: String, _ lastName: String){
        self.firstName = BehaviorRelay<String>(value: firstName)
        self.lastName = BehaviorRelay<String>(value: lastName)
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
