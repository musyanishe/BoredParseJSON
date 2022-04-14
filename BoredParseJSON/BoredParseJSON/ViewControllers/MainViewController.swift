//
//  MainViewController.swift
//  BoredParseJSON
//
//  Created by Евгения Шевцова on 13.04.2022.
//

import Foundation
import UIKit

enum UserActions: String {
    case urlSessionGet = "URL Session"
    case alamofireGet = "Alamofire"
}

class MainViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let urlSessionVSAlamofireVC = segue.destination as? UrlSessionVSAlamofireViewController else {return}
            switch segue.identifier {
            case "urlSession": urlSessionVSAlamofireVC.fetchActivityForButton()
            case "alamofireGet": urlSessionVSAlamofireVC.alamofireActivityButtonPressed()
            default: break
            }
        }

}
