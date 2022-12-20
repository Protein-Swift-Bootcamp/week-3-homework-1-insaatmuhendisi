//
//  SecondViewController.swift
//  simpra_hw1_halil
//
//  Created by Halil Ibrahim Andic on 19.12.2022.
//
import UIKit

//MARK: - PROTOCOL
protocol canTransfer {
    func didTransfer(_ data: String)
}

//MARK: - DELEGATOR
class SecondViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    let data = "hi"
    var delegate: canTransfer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // this function reads the data written and checks if it is nil
    func gatherData() -> String {
        guard let entry = textField.text else {
            return "Nothing written"
        }
        return entry
    }
    
    // triggers when protocol button pressed
    @IBAction func protocolButtonPressed(_ sender: UIButton) {
        delegate?.didTransfer(data)
  
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // triggers when NC button pressed
    @IBAction func NCButtonPressed(_ sender: UIButton) {
        // create data dictionary
        let dataDict = ["entry" : gatherData()]
        
        // post a notification
        NotificationCenter.default.post(name: NSNotification.Name("notificationName"), object: nil, userInfo: dataDict)
        
        //go back to the 1st screen
        self.dismiss(animated: true, completion: nil)
    }
    
    // triggers when closure button pressed
    @IBAction func closureButtonPressed(_ sender: UIButton) {
        
        
        //go back to the 1st screen
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: - EXTENSION

