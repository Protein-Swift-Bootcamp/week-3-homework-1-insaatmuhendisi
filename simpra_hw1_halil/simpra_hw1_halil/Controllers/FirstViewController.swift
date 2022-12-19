//
//  FirstViewController.swift
//  simpra_hw1_halil
//
//  Created by Halil Ibrahim Andic on 19.12.2022.
//

import UIKit

//MARK: - DELEGATE
class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

//MARK: - DELEGATE EXTENSION
extension FirstViewController: canTransfer {
    
    func transfer(data: String) {
        print(data)
    }
}
