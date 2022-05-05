//
//  ViewController.swift
//  BoredParseJSON
//
//  Created by Евгения Шевцова on 10.04.2022.
//

import UIKit

class UrlSessionViewController: UIViewController {
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var activityLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var participantsLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var accessibilitiesLabel: UILabel!
    
    var bored: Bored!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityLabel.isHidden = true
        typeLabel.isHidden = true
        participantsLabel.isHidden = true
        priceLabel.isHidden = true
        accessibilitiesLabel.isHidden = true
        
        fetchActivityForButton()
        
    }
    
    
    @IBAction func activityButtonPressed(_ sender: UIButton) {
        fetchActivityForButton()
    }
    
    func fetchActivityForButton() {
        NetworkManager.shared.fetchActivity(from: "https://www.boredapi.com/api/activity") {
            result in
            switch result {
            case .success(let bored):
                DispatchQueue.main.async {
                    self.activityLabel.text = "Activity: \(bored.activity)"
                    self.typeLabel.text = "Type: \(bored.type)"
                    self.participantsLabel.text = "Participants: \(bored.participants)"
                    self.priceLabel.text = "Price: \(bored.price)"
                    self.accessibilitiesLabel.text = "Accessibility: \(bored.accessibility)"
                    self.activityIndicator.stopAnimating()
                    self.activityLabel.isHidden = false
                    self.typeLabel.isHidden = false
                    self.participantsLabel.isHidden = false
                    self.priceLabel.isHidden = false
                    self.accessibilitiesLabel.isHidden = false
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    

    
}

