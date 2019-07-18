//
//  GreetingViewController.swift
//  GreetingExample
//
//  Created by Zeno on 16/07/2019.
//  Copyright © 2019 Zeno. All rights reserved.
//

import Foundation
import UIKit

class GreetingViewController: UIViewController {
    
    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var greetingMessageLabel: UILabel!
    
    @IBAction func goodByeButtonTouched(_ sender: Any) {
        
    }
    
    var viewModel = GreetingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello")
        _ = firstNameLabel.rx.text.map{ $0 ?? "" }.bind(to: viewModel.firstName)
        _ = lastNameLabel.rx.text.map{ $0 ?? "" }.bind(to: viewModel.lastName)
        
        _ = viewModel.message.bind(to: greetingMessageLabel.rx.text)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sayGoodBye" {
            let destVC = segue.destination as! GoodbyeViwController
            
            print("prepare")
//            let dataProvider = DataProvider(firstNameLabel.text!, lastNameLabel.text!)
//            destVC.viewModel.dataProvider = dataProvider
            destVC.viewModel.firstName.accept(firstNameLabel.text!)
            destVC.viewModel.lastName.accept(lastNameLabel.text!)
        }
    }
    
}
