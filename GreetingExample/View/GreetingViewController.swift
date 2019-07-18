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
        
        firstNameLabel.rx.text.map{ $0 ?? "" }.bind(to: viewModel.firstName)
            .disposed(by: disposeBag)
        lastNameLabel.rx.text.map{ $0 ?? "" }.bind(to: viewModel.lastName)
            .disposed(by: disposeBag)
        
        viewModel.message.bind(to: greetingMessageLabel.rx.text)
            .disposed(by: disposeBag)
    }
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sayGoodBye" {
            let destVC = segue.destination as! GoodbyeViwController
            
            print("prepare")
//            let dataProvider = DataProvider(firstNameLabel.text!, lastNameLabel.text!)
//            destVC.viewModel.dataProvider = dataProvider
//            destVC.viewModel.firstName.accept(firstNameLabel.text ?? "")
//            destVC.viewModel.lastName.accept(lastNameLabel.text ?? "")
            
            let goodByeViewModel =  GoodbyeViewModel(viewModel.firstName.value, viewModel.lastName.value)
            destVC.viewModel = goodByeViewModel
            
            // firstName, lastName으로 DataProvider 생성
            // Service에게 생성한 DataProvider를 전달
        }
    }
 */
}
