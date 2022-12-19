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
    
    
    @IBOutlet weak var textField: UITextField!
    
    var delegate: canTransfer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func toDelegation() {
        delegate?.transfer(data: "hi")
    }
    
    @IBAction func protocolButtonPressed(_ sender: UIButton) {
        
        
        //go back to the 1st screen
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func NCButtonPressed(_ sender: UIButton) {
        
        
        //go back to the 1st screen
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closureButtonPressed(_ sender: UIButton) {
        
        
        //go back to the 1st screen
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
