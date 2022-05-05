//
//  ManualParsingWithAlamofireViewController.swift
//  BoredParseJSON
//
//  Created by Евгения Шевцова on 05.05.2022.
//

import UIKit

class ManualParsingWithAlamofireViewController: UIViewController {
    
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
        
        fetchDataWIthManualParsing()
    }
    
    @IBAction func activityButtonPressed(_ sender: UIButton) {
        fetchDataWIthManualParsing()
    }
    
    func fetchDataWIthManualParsing() {
        NetworkManager.shared.fetchAlamofireActivity(from: "https://www.boredapi.com/api/activity") {
            result in
            switch result {
            case .success(let bored):
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
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }

}
