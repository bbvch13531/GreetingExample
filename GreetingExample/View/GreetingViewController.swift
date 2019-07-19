//
//  GreetingViewController.swift
//  GreetingExample
//
//  Created by Zeno on 16/07/2019.
//  Copyright © 2019 Zeno. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class GreetingViewController: UIViewController {
    
    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var greetingMessageLabel: UILabel!
    
    @IBAction func goodByeButtonTouched(_ sender: Any) {
        let goodByeViewController = GoodbyeViwController(firstName: viewModel.firstName.value, lastName: viewModel.lastName.value)
        self.present(goodByeViewController, animated: true, completion: nil)
    }
    
    var viewModel = GreetingViewModel()
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello")
        
        firstNameLabel.rx.text.orEmpty.bind(to: viewModel.firstName)
            .disposed(by: disposeBag)
        lastNameLabel.rx.text.orEmpty.bind(to: viewModel.lastName)
            .disposed(by: disposeBag)
        
        viewModel.message.bind(to: greetingMessageLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
