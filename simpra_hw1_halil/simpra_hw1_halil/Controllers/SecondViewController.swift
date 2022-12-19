//
//  SecondViewController.swift
//  simpra_hw1_halil
//
//  Created by Halil Ibrahim Andic on 19.12.2022.
//
import UIKit

//MARK: - PROTOCOL
protocol canTransfer {
    func transfer(data: String)
}

//MARK: - DELEGATOR
class SecondViewController: UIViewController {
    
    var delegate: canTransfer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func toDelegation() {
        delegate?.transfer(data: "hi")
    }
    
}
