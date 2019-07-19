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

    var viewModel: GoodbyeViewModel{
        didSet {
            viewModel.message.bind(to: goodByeLabel.rx.text)
            .disposed(by: disposeBag)
        }
    }
 
    init(firstName: String, lastName: String){
        self.viewModel = GoodbyeViewModel(firstName, lastName)
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(){
        self.init(firstName: "", lastName: "")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = GoodbyeViewModel()
        super.init(coder: aDecoder)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(goodByeLabel)
    }
}
