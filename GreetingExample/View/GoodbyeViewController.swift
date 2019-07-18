//
//  GoodByeViewController.swift
//  GreetingExample
//
//  Created by Zeno on 16/07/2019.
//  Copyright © 2019 Zeno. All rights reserved.
//

import Foundation
import UIKit

class GoodbyeViwController: UIViewController {
    
    @IBOutlet weak var goodByeLabel: UILabel!
    
    var viewModel = GoodbyeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = viewModel.message.bind(to: goodByeLabel.rx.text)
    }
}
