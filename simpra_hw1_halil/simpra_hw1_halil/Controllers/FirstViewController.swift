//
//  FirstViewController.swift
//  simpra_hw1_halil
//
//  Created by Halil Ibrahim Andic on 19.12.2022.
//
import UIKit

//MARK: - DELEGATE
class FirstViewController: UIViewController {
    
    // outlet connections to Label fields
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var transferLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataLabel.text = """
            Simpra iOS Bootcamp
            Homework 1
            Halil Ibrahim Andic
            """
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        // create a connection between my second storyboard and second VC
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondStoryboard") as? SecondViewController {
            // assign FirstViewController as a delegate
            secondVC.delegate = self
            
            // shows second storyboard
            present(secondVC, animated: true, completion: nil)
        }
        
        // -- NOTIFICATION CENTER --
        // register to receive notification
        NotificationCenter.default.addObserver(self, selector: #selector(didNotificationArrive(notification:)), name: NSNotification.Name(rawValue: "notificationName"), object: nil)
    }
}

//MARK: - DELEGATE EXTENSION
extension FirstViewController: canTransfer {
    
    // -- PROTOCOL --
    func didTransfer(_ data: String) {
        dataLabel.text = data
        transferLabel.text = "transferred by protocol"
    }

    // -- NOTIFICATION CENTER --
    // NC observer (handles the incoming notification)
    @objc func didNotificationArrive(notification: NSNotification) {
        dataLabel.text = notification.userInfo!["entry"] as? String
        transferLabel.text = "transferred by notification center"
    }
    
    // -- CLOSURE --
    func didClosureArrive(text: String) {
        dataLabel.text = text
        transferLabel.text = "transferred by closure"
    }
}
