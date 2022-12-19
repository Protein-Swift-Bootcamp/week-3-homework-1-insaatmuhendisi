//
//  FirstViewController.swift
//  simpra_hw1_halil
//
//  Created by Halil Ibrahim Andic on 19.12.2022.
//

import UIKit

//MARK: - DELEGATE
class FirstViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var transferLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataLabel.text = ""
        transferLabel.text = ""
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToSecond", sender: self)
    }
    

}

//MARK: - DELEGATE EXTENSION
extension FirstViewController: canTransfer {
    
    func transfer(data: String) {
        print(data)
    }
}
