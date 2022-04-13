//
//  AlamofireViewController.swift
//  BoredParseJSON
//
//  Created by Евгения Шевцова on 12.04.2022.
//

import UIKit
import Alamofire

class AlamofireViewController: UIViewController {
    
    @IBOutlet var activityIndicatorAlamofire: UIActivityIndicatorView!
    @IBOutlet var activityAlamofireLabel: UILabel!
    @IBOutlet var typeAlamofireLabel: UILabel!
    @IBOutlet var participantsAlamofireLabel: UILabel!
    @IBOutlet var priceAlamofireLabel: UILabel!
    @IBOutlet var accessibilityAlamofireLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityAlamofireLabel.isHidden = true
        typeAlamofireLabel.isHidden = true
        participantsAlamofireLabel.isHidden = true
        priceAlamofireLabel.isHidden = true
        accessibilityAlamofireLabel.isHidden = true
        
//        activityAlamofireLabel.text =
    }
    
    @IBAction func activityAlamofireBurronPressed(_ sender: UIButton) {
        alamofireActivityButtonPressed()
    }
    
    func alamofireActivityButtonPressed() {
//        NetworkManager.shared.fetchAlamofireActivity(from: "https://www.boredapi.com/api/activity") { result in
//            switch result {
//            case .success(let boredData):
//                self.
//            }
        }
    }
    

