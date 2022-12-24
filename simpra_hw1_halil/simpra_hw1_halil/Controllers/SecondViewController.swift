//
//  SecondViewController.swift
//  simpra_hw1_halil
//
//  Created by Halil Ibrahim Andic on 19.12.2022.
//
import UIKit

//MARK: - PROTOCOL
protocol canTransfer {
    func didTransfer(_ data: [String:String])
}

//MARK: - DELEGATOR
class SecondViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var surnameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    // Protocol variable
    var delegate: canTransfer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /* this function obtains the data filled in the form
     and returns it as a dictionary. */
    func gatherData() -> [String: String] {
        var formDictionary: [String: String] = [:]
        
        formDictionary["name"] = nameField.text ?? ""
        formDictionary["surname"] = surnameField.text ?? ""
        formDictionary["age"] = ageField.text ?? ""
        
        return formDictionary
    }
    
    @IBAction func protocolButtonPressed(_ sender: UIButton) {
        // sends the gathered data to the delegate function of first VC
        delegate?.didTransfer(gatherData())
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func NCButtonPressed(_ sender: UIButton) {
        // post a notification
        NotificationCenter.default.post(name: NSNotification.Name("notificationName"), object: nil, userInfo: gatherData())
        dismiss(animated: true, completion: nil)
    }

    @IBAction func closureButtonPressed(_ sender: UIButton) {
        // create an instance of FirstViewController
        if let firstVC = presentingViewController as? FirstViewController {
            //sends the data in completion closure
            dismiss(animated: true, completion: {
                firstVC.didClosureArrive(data: self.gatherData())
            })
        }
    }
}
