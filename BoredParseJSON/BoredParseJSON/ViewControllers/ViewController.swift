//
//  ViewController.swift
//  BoredParseJSON
//
//  Created by Евгения Шевцова on 10.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var activityLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var participantsLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var accessibilitiesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        fetchActivityForButton()
    }
    
    
    @IBAction func activityButtonPressed(_ sender: UIButton) {
        fetchActivityForButton()
    }
    
    private func fetchActivityForButton() {
        NetworkManager.shared.fetchActivity(from: "https://www.boredapi.com/api/activity") {
            result in
            switch result {
            case .success(let bored):
                DispatchQueue.main.async {
                    self.activityLabel.text = "Activity: \(bored.activity ?? "")"
                    self.typeLabel.text = "Type: \(bored.type ?? "")"
                    self.participantsLabel.text = "Participants: \(bored.participants ?? 0)"
                    self.priceLabel.text = "Price: \(bored.price ?? 0)"
                    self.accessibilitiesLabel.text = "Accessibility: \(bored.accessibility ?? 0)"
                    self.activityIndicator.stopAnimating()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

