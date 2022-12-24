//
//  FirstViewController.swift
//  simpra_hw1_halil
//
//  Created by Halil Ibrahim Andic on 19.12.2022.
//
import UIKit

//MARK: - DELEGATE
class FirstViewController: UIViewController {
    
    // outlet connections of label fields
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var transferLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        // create a connection between my second storyboard and second VC
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondStoryboard") as? SecondViewController {
            // assign FirstViewController as a delegate
            secondVC.delegate = self
            
            // shows second storyboard
            secondVC.modalPresentationStyle = .fullScreen
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
    func didTransfer(_ data: [String:String]) {
        showResult(data)
        transferLabel.text = "transferred by protocol"
    }

    // -- NOTIFICATION CENTER --
    // NC observer (handles the incoming notification)
    @objc func didNotificationArrive(notification: NSNotification) {
        
        let data: [String:String] = notification.userInfo! as? [String:String] ?? ["":""]
        showResult(data)
        transferLabel.text = "transferred by notification center"
    }

    // -- CLOSURE --
    func didClosureArrive(data: [String:String]) {
        showResult(data)
        transferLabel.text = "transferred by closure"
    }
    
    // this function changes the text of related labels
    func showResult(_ data: [String:String]) {
        nameLabel.text = data["name"]
        surnameLabel.text = data["surname"]
        ageLabel.text = data["age"]
    }
}
