//
//  GoodByeViewController.swift
//  GreetingExample
//
//  Created by Zeno on 16/07/2019.
//  Copyright © 2019 Zeno. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class GoodbyeViwController: UIViewController {
    
    var goodByeLabel = UILabel(frame: CGRect(x: 50, y: 50, width: 200, height: 50))
    
    var disposeBag = DisposeBag()
    var viewModel: GoodbyeViewModel?
    /*
    var viewModel: GoodbyeViewModel? {
        didSet {
            viewModel?.message.bind(to: goodByeLabel!.rx.text)
            .disposed(by: disposeBag)
        }
    }
    */
    init(firstName: String, lastName: String){
        super.init(nibName: nil, bundle: nil)
        self.viewModel = GoodbyeViewModel(firstName, lastName)
        viewModel?.message.bind(to: goodByeLabel.rx.text)
            .disposed(by: disposeBag)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(goodByeLabel)
    }
}
