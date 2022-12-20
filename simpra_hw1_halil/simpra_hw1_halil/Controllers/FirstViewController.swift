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
        
        // create an instance of 2nd VC
        let secondVC = SecondViewController()
        
        // tells 2nd VC that i am the current delegate
        secondVC.delegate = self
        
        // register to receive notification
        NotificationCenter.default.addObserver(self, selector: #selector(didNotificationArrive(notification:)), name: NSNotification.Name(rawValue: "notificationName"), object: nil)
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        //present(secondVC, animated: true, completion: nil)
        self.performSegue(withIdentifier: "goToSecond", sender: self)
    }
}

//MARK: - DELEGATE EXTENSION
extension FirstViewController: canTransfer {

    // protocol function
    func didTransfer(_ data: String) {
        print(data)
        dataLabel.text = data
    }
    
    // notification center observer (handles the incoming notification)
    @objc func didNotificationArrive(notification: NSNotification) {
        if let data = notification.userInfo?["entry"] as? String {
            dataLabel.text = data
            transferLabel.text = "transfered by notification center"
        }
    }
    
}
