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
    }
    
    @IBAction func activityAlamofireBurronPressed(_ sender: UIButton) {
        alamofireActivityButtonPressed()
    }
    
    private func alamofireActivityButtonPressed() {
        AF.request("https://www.boredapi.com/api/activity")
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let boredData = value as? [[String: Any]] else { return }
                    print(boredData)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
}
