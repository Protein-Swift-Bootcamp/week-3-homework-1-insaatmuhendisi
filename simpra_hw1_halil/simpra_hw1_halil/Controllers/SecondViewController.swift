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
    
    // Protocol variable
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
    
    @IBAction func protocolButtonPressed(_ sender: UIButton) {
        // sends the gathered data to the protocol function of the delegate (first VC)
        delegate?.didTransfer(gatherData())
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func NCButtonPressed(_ sender: UIButton) {
        // create data dictionary
        let dataDict = ["entry" : gatherData()]
        
        // post a notification
        NotificationCenter.default.post(name: NSNotification.Name("notificationName"), object: nil, userInfo: dataDict)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closureButtonPressed(_ sender: UIButton) {
        // create an instance of FirstViewController
        if let firstVC = presentingViewController as? FirstViewController {
            //sends the data in completion closure
            dismiss(animated: true, completion: {
                firstVC.didClosureArrive(text: self.gatherData())
            })
        }
    }
}
